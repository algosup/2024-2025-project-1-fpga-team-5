`include "modules/7_segments.v"
`include "sprites/player.v"
`include "sprites/road.v"
`include "sprites/grass.v"
`include "sprites/car.v"
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
    
    reg [6:0] level = 0;

    always @(posedge i_Clk) begin
        if (player_y == 1) begin
                if (level == 99) begin
                    level <= 0;
                end else begin
                    level <= level + 1;
                end          
        end else if (o_reset == 1) begin
            level <= 0;
        end
    end // always @(posedge i_Clk)

    // display level_counter on 7_segments module
    seven_segments level_counter(
        .counter(level),
        .o_Segment1(o_Segment1),
        .o_Segment2(o_Segment2)
    );

    // Player module
    wire [4:0] player_x;
    wire [3:0] player_y;
    reg i_reset = 0;
    wire o_reset;
    player player_module (
        .i_Clk(i_Clk),
        .i_player_up(i_Switch_1),
        .i_player_down(i_Switch_4),
        .i_player_left(i_Switch_2),
        .i_player_right(i_Switch_3),
        .o_player_x(player_x),
        .o_player_y(player_y),
        .i_reset(i_reset),
        .o_reset(o_reset)
    );


    // Road module
    wire [3:0] road_top_start;
    wire [3:0] road_top_end;
    wire [3:0] road_bottom_start;
    wire [3:0] road_bottom_end;
    road road_module (
        .road_top_start(road_top_start),
        .road_top_end(road_top_end),
        .road_bottom_start(road_bottom_start),
        .road_bottom_end(road_bottom_end)
    );

    // Grass module
    wire [3:0] grass_arrival_start;
    wire [3:0] grass_arrival_end;
    wire [3:0] grass_middle_start;
    wire [3:0] grass_middle_end;
    wire [3:0] grass_spawn_start;
    wire [3:0] grass_spawn_end;
    grass grass_module (
        .grass_arrival_start(grass_arrival_start),
        .grass_arrival_end(grass_arrival_end),
        .grass_middle_start(grass_middle_start),
        .grass_middle_end(grass_middle_end),
        .grass_spawn_start(grass_spawn_start),
        .grass_spawn_end(grass_spawn_end)
    );


    // Car module
    // TODO: Find a way to clean this up
    reg [4:0] i_car_x = 1;
    reg [2:0] i_car_speed = 2;
    wire [4:0] car_x;
    wire [3:0] car_y = 2;
    car car_module (
        .i_Clk(i_Clk),
        .i_car_x(i_car_x),
        .i_car_speed(i_car_speed),
        .o_car_x(car_x),
    );

    reg [4:0] i_car2_x = 15;
    reg [2:0] i_car2_speed = 3;
    wire [4:0] car2_x;
    wire [3:0] car2_y = 3;
    car car2_module (
        .i_Clk(i_Clk),
        .i_car_x(i_car2_x),
        .i_car_speed(i_car2_speed),
        .o_car_x(car2_x),
    );

    reg [4:0] i_car3_x = 17;
    reg [2:0] i_car3_speed = 2;
    wire [4:0] car3_x;
    wire [3:0] car3_y = 4;
    car car3_module (
        .i_Clk(i_Clk),
        .i_car_x(i_car3_x),
        .i_car_speed(i_car3_speed),
        .o_car_x(car3_x),
    );

    reg [4:0] i_car4_x = 9;
    reg [2:0] i_car4_speed = 2;
    wire [4:0] car4_x;
    wire [3:0] car4_y = 5;
    car car4_module (
        .i_Clk(i_Clk),
        .i_car_x(i_car4_x),
        .i_car_speed(i_car4_speed),
        .o_car_x(car4_x),
    );

    reg [4:0] i_car5_x = 10;
    reg [2:0] i_car5_speed = 3;
    wire [4:0] car5_x;
    wire [3:0] car5_y = 6;
    car car5_module (
        .i_Clk(i_Clk),
        .i_car_x(i_car5_x),
        .i_car_speed(i_car5_speed),
        .o_car_x(car5_x),
    );

    reg [4:0] i_car6_x = 7;
    reg [2:0] i_car6_speed = 1;
    wire [4:0] car6_x;
    wire [3:0] car6_y = 7;
    car car6_module (
        .i_Clk(i_Clk),
        .i_car_x(i_car6_x),
        .i_car_speed(i_car6_speed),
        .o_car_x(car6_x),
    );
    
    reg [4:0] i_car7_x = 12;
    reg [2:0] i_car7_speed = 1;
    wire [4:0] car7_x;
    wire [3:0] car7_y = 10;
    car car7_module (
        .i_Clk(i_Clk),
        .i_car_x(i_car7_x),
        .i_car_speed(i_car7_speed),
        .o_car_x(car7_x),
    );

    reg [4:0] i_car8_x = 20;
    reg [2:0] i_car8_speed = 1;
    wire [4:0] car8_x;
    wire [3:0] car8_y = 11;
    car car8_module (
        .i_Clk(i_Clk),
        .i_car_x(i_car8_x),
        .i_car_speed(i_car8_speed),
        .o_car_x(car8_x),
    );

    reg [4:0] i_car9_x = 19;
    reg [2:0] i_car9_speed = 1;
    wire [4:0] car9_x;
    wire [3:0] car9_y = 12;
    car car9_module (
        .i_Clk(i_Clk),
        .i_car_x(i_car9_x),
        .i_car_speed(i_car9_speed),
        .o_car_x(car9_x),
    );

    reg [4:0] i_car10_x = 6;
    reg [2:0] i_car10_speed = 1;
    wire [4:0] car10_x;
    wire [3:0] car10_y = 13;
    car car10_module (
        .i_Clk(i_Clk),
        .i_car_x(i_car10_x),
        .i_car_speed(i_car10_speed),
        .o_car_x(car10_x),
    );

    reg [4:0] i_car11_x = 9;
    reg [2:0] i_car11_speed = 2;
    wire [4:0] car11_x;
    wire [3:0] car11_y = 14;
    car car11_module (
        .i_Clk(i_Clk),
        .i_car_x(i_car11_x),
        .i_car_speed(i_car11_speed),
        .o_car_x(car11_x),
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
    reg [4:0] cell_x = 0;
    reg [3:0] cell_y = 0;

    // Color output logic: Color only the left half of the screen
    wire pixel_color;
    assign pixel_color = (h_active && v_active);

    always @(i_Clk) begin
        i_reset <= 0; 
        if (pixel_color) begin
            if ((car_x == cell_x && car_y == cell_y)
                    || (car2_x == cell_x && car2_y == cell_y)
                    || (car3_x == cell_x && car3_y == cell_y)
                    || (car4_x == cell_x && car4_y == cell_y)
                    || (car5_x == cell_x && car5_y == cell_y)
                    || (car6_x == cell_x && car6_y == cell_y)
                    || (car7_x == cell_x && car7_y == cell_y)
                    || (car8_x == cell_x && car8_y == cell_y)
                    || (car9_x == cell_x && car9_y == cell_y)
                    || (car10_x == cell_x && car10_y == cell_y)
                    // || (car11_x == cell_x && car11_y == cell_y)
            ) begin
                o_VGA_Red <= 3'b111; o_VGA_Grn <= 3'b000; o_VGA_Blu <= 3'b000; // Car
                if (cell_x == player_x && cell_y == player_y) begin
                    o_VGA_Red <= 3'b111; o_VGA_Grn <= 3'b000; o_VGA_Blu <= 3'b111; // Player
                    i_reset <= 1;
                end
            end else if (cell_x == player_x && cell_y == player_y) begin
                o_VGA_Red <= 3'b000; o_VGA_Grn <= 3'b000; o_VGA_Blu <= 3'b111; // Player
            end else if ((cell_y >= road_top_start && cell_y < road_top_end) || (cell_y >= road_bottom_start && cell_y < road_bottom_end )) begin
                o_VGA_Red <= 3'b001; o_VGA_Grn <= 3'b001; o_VGA_Blu <= 3'b001; // Roads
            end else if ((cell_y >= grass_arrival_start && cell_y < grass_arrival_end) || (cell_y >= grass_middle_start && cell_y < grass_middle_end) || (cell_y >= grass_spawn_start && cell_y <= grass_spawn_end)) begin
                o_VGA_Red <= 3'b000; o_VGA_Grn <= 3'b101; o_VGA_Blu <= 3'b001; // Grass
            end else begin
                o_VGA_Red <= 3'b000; o_VGA_Grn <= 3'b000; o_VGA_Blu <= 3'b000; // Black
            end
        end else begin
            o_VGA_Red <= 3'b000;
            o_VGA_Grn <= 3'b000;
            o_VGA_Blu <= 3'b000;
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