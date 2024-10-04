`include "modules/7_segments.v"
`include "modules/vga.v"
`include "sprites/player.v"
`include "sprites/road.v"
`include "sprites/grass.v"
module main (
    // Clock
    input i_Clk,

    // 7-segments display
    output reg [6:0] o_Segment1,
    output reg [6:0] o_Segment2,

    input i_Switch_1,
    input i_Switch_2,
    input i_Switch_3,
    input i_Switch_4,

    // VGA
    output o_VGA_HSync, // Horizontal Sync
    output o_VGA_VSync, // Vertical Sync

    output reg [2:0] o_VGA_Red,
    output reg [2:0] o_VGA_Grn,
    output reg [2:0] o_VGA_Blu,
);
    
    reg [24:0] clock_tick = 0;
    reg [6:0] level = 0;

    always @(posedge i_Clk) begin
        if (player_y == 1) begin
            if (level == 99) begin
                level <= 0;
            end else begin
                level <= level + 1;
            end
        end

        if (clock_tick < 25000000) begin
            clock_tick <= clock_tick + 1;
        end else begin
            // 1 second has passed
            clock_tick <= 0;
        end // if (clock_tick < 25000000)
    end // always @(posedge i_Clk)

    // display level_counter on 7_segments module
    seven_segments level_counter(
        .counter(level),
        .o_Segment1(o_Segment1),
        .o_Segment2(o_Segment2)
    );


    // Player module
    wire [9:0] player_x;
    wire [9:0] player_y;
    player player_module (
        .i_Clk(i_Clk),
        .i_player_up(i_Switch_1),
        .i_player_down(i_Switch_4),
        .i_player_left(i_Switch_2),
        .i_player_right(i_Switch_3),
        .o_player_x(player_x),
        .o_player_y(player_y)
    );


    // Road module
    wire [9:0] road_start;
    wire [9:0] road_end;
    road road_module (
        .road_start(road_start),
        .road_end(road_end)
    );

    // Grass module
    wire [9:0] grass_arrival_start;
    wire [9:0] grass_arrival_end;
    wire [9:0] grass_spawn_start;
    wire [9:0] grass_spawn_end;
    grass grass_module (
        .grass_arrival_start(grass_arrival_start),
        .grass_arrival_end(grass_arrival_end),
        .grass_spawn_start(grass_spawn_start),
        .grass_spawn_end(grass_spawn_end)
    );

    // VGA module
    // VGA timing constants for 640x480 resolution
    parameter H_SYNC_CYCLES = 92;
    parameter H_BACK_PORCH  = 50;
    parameter H_DISPLAY     = 640;
    parameter H_FRONT_PORCH = 18;
    parameter H_LINE        = H_SYNC_CYCLES + H_BACK_PORCH + H_DISPLAY + H_FRONT_PORCH;

    parameter V_SYNC_CYCLES = 2;
    parameter V_BACK_PORCH  = 33;
    parameter V_DISPLAY     = 480;
    parameter V_FRONT_PORCH = 10;
    parameter V_FRAME       = V_SYNC_CYCLES + V_BACK_PORCH + V_DISPLAY + V_FRONT_PORCH;

    reg [9:0] h_counter = 0;
    reg [9:0] v_counter = 0;

    wire h_active = (h_counter >= (H_SYNC_CYCLES + H_BACK_PORCH)) && (h_counter < (H_SYNC_CYCLES + H_BACK_PORCH + H_DISPLAY));
    wire v_active = (v_counter >= (V_SYNC_CYCLES + V_BACK_PORCH)) && (v_counter < (V_SYNC_CYCLES + V_BACK_PORCH + V_DISPLAY));

    // Generate sync signals
    assign o_VGA_HSync = ~(h_counter < H_SYNC_CYCLES);
    assign o_VGA_VSync = ~(v_counter < V_SYNC_CYCLES);

    reg [9:0] tile_size = (H_DISPLAY/20);
    reg [9:0] cell_x = 0;
    reg [9:0] cell_y = 0;

    // Color output logic: Color only the left half of the screen
    wire pixel_color;
    assign pixel_color = (h_active && v_active);

    always @(*) begin
        if (pixel_color) begin
            if (cell_x == player_x && cell_y == player_y) begin
                o_VGA_Red = 3'b000; o_VGA_Grn = 3'b000; o_VGA_Blu = 3'b111; // Blue
            end else if (cell_y > road_start && cell_y <= road_end) begin
                o_VGA_Red = 3'b111; o_VGA_Grn = 3'b000; o_VGA_Blu = 3'b000; // Red
            end else if (cell_y > grass_arrival_start && cell_y <= grass_arrival_end) begin
                o_VGA_Red = 3'b000; o_VGA_Grn = 3'b111; o_VGA_Blu = 3'b000; // Green
            end else if (cell_y > grass_spawn_start && cell_y <= grass_spawn_end) begin
                o_VGA_Red = 3'b000; o_VGA_Grn = 3'b111; o_VGA_Blu = 3'b000; // Green
            end else begin
                o_VGA_Red = 3'b000; o_VGA_Grn = 3'b000; o_VGA_Blu = 3'b000; // Black
            end
        end else begin
            o_VGA_Red = 3'b000;
            o_VGA_Grn = 3'b000;
            o_VGA_Blu = 3'b000;
        end
    end

    // Horizontal counter
    always @(posedge i_Clk) begin

        if (h_counter == H_LINE - 1) begin
            h_counter <= 0;
            cell_x <= 0;
            if (v_counter == V_FRAME - 1) begin
                v_counter <= 0;
                cell_y <= 0;
            end else begin
                v_counter <= v_counter + 1;
                if (v_counter > V_SYNC_CYCLES* V_BACK_PORCH + (tile_size*(cell_y-1))) begin
                    cell_y <= cell_y + 1;
                end
            end
            
        end else begin
            h_counter <= h_counter + 1;
            if (h_counter > H_SYNC_CYCLES + H_BACK_PORCH + (tile_size*cell_x)) begin
                cell_x <= cell_x + 1;
            end
        end        
    end

endmodule