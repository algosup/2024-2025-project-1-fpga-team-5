`include "modules/7_segments.v"
`include "modules/vga.v"
`include "modules/movements.v"
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

    output o_LED_1,
);
    
    reg [24:0] clock_tick = 0;
    reg [6:0] level = 0;

    always @(posedge i_Clk) begin
        if (clock_tick < 25000000) begin
            clock_tick <= clock_tick + 1;
        end else begin
            // 1 second has passed

            // increment level, TODO: remove this after adding a level increament logic
            if (level == 99) begin
                level <= 0;
            end else begin
                level <= level + 1;
            end // if (level == 99)
            clock_tick <= 0;
        end // if (clock_tick < 25000000)
    end // always @(posedge i_Clk)

    // display level_counter on 7_segments module
    seven_segments level_counter(
        .counter(level),
        .o_Segment1(o_Segment1),
        .o_Segment2(o_Segment2)
    );


    // VGA module

    // Defining the game map
    reg [59:0] map [0:14];
    reg [59:0] row_value;  // To store an entire row

    initial begin
    // Initialize the array manually (since Verilog doesn't support direct initialization)
    // Initialize each row with 3-bit values packed into 60 bits
    map[0]  = 60'b001_000_001_000_001_000_001_000_001_000_001_000_001_000_001_000_001_000_001_000; // [1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0]
    map[1]  = 60'b000_001_000_001_000_001_000_001_000_001_000_001_000_001_000_001_000_001_000_001; // [0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1]
    map[2]  = 60'b001_000_001_000_001_000_001_000_001_000_001_000_001_000_001_000_001_000_001_000; // [1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0]
    map[3]  = 60'b000_001_000_001_000_001_000_001_000_001_000_001_000_001_000_001_000_001_000_001; // [0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1]
    map[4]  = 60'b001_000_001_000_001_000_001_000_001_000_001_000_001_000_001_000_001_000_001_000; // [1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0]
    map[5]  = 60'b000_001_000_001_000_001_000_001_000_001_000_001_000_001_000_001_000_001_000_001; // [0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1]
    map[6]  = 60'b001_000_001_000_001_000_001_000_001_000_001_000_001_000_001_000_001_000_001_000; // [1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0]
    map[7]  = 60'b000_001_000_001_000_001_000_001_000_001_000_001_000_001_000_001_000_001_000_001; // [0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1]
    map[8]  = 60'b001_000_001_000_001_000_001_000_001_000_001_000_001_000_001_000_001_000_001_000; // [1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0]
    map[9]  = 60'b000_001_000_001_000_001_000_001_000_001_000_001_000_001_000_001_000_001_000_001; // [0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1]
    map[10] = 60'b001_000_001_000_001_000_001_000_001_000_001_000_001_000_001_000_001_000_001_000; // [1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0]
    map[11] = 60'b000_001_000_001_000_001_000_001_000_001_000_001_000_001_000_001_000_001_000_001; // [0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1]
    map[12] = 60'b001_000_001_000_001_000_001_000_001_000_001_000_001_000_001_000_001_000_001_000; // [1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0]
    map[13] = 60'b000_001_000_001_000_001_000_001_000_001_000_001_000_001_000_001_000_001_000_001; // [0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1]
    map[14] = 60'b001_000_001_000_001_000_001_000_001_010_001_000_001_000_001_000_001_000_001_000; // [1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0]
    end

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
    assign pixel_color = (h_active && v_active && (h_counter < H_SYNC_CYCLES + H_BACK_PORCH + H_DISPLAY) && (v_counter < V_SYNC_CYCLES + V_BACK_PORCH + V_DISPLAY));

    // Color signals for white pixel (RGB = 111 111 111)
    always @(*) begin
        if (pixel_color) begin
            row_value = map[cell_y];
            case (row_value[cell_x*3+2 : cell_x*3])
                3'b000: begin
                        o_VGA_Red = 3'b111; o_VGA_Grn = 3'b000; o_VGA_Blu = 3'b000; // Red
                    end
                3'b001: begin
                    o_VGA_Red = 3'b000; o_VGA_Grn = 3'b111; o_VGA_Blu = 3'b000; // Green
                end
                3'b010: begin
                    o_VGA_Red = 3'b000; o_VGA_Grn = 3'b000; o_VGA_Blu = 3'b111; // Green
                end
                default: begin
                    o_VGA_Red = 3'b000; o_VGA_Grn = 3'b000; o_VGA_Blu = 3'b000; // Black
                end
            endcase
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
                if (v_counter > V_SYNC_CYCLES* V_BACK_PORCH + (tile_size*cell_y)) begin
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

    reg [9:0] player_pos_x = 10;
    reg [9:0] player_pos_y = 15;    

    // Temporary variable to store new player position
    reg [9:0] new_player_pos_y;
    reg [9:0] new_player_pos_x;

    // Movements module
    always @(posedge i_Clk) begin
        if (i_Switch_1 & clock_tick == 25000000) begin
            // Move player up
            if (player_pos_y > 0) begin
                // Replace the previous tile
                map[player_pos_y] <= (map[player_pos_y] & ~(3'b010 << (player_pos_x * 3))) | (3'b001 << (player_pos_x * 3));
                
                new_player_pos_y = player_pos_y - 1;
                
                // Move player up
                player_pos_y <= new_player_pos_y;
                
                // Set the new player position
                map[new_player_pos_y] <= (map[new_player_pos_y] & ~(3'b111 << (player_pos_x * 3))) | (3'b010 << (player_pos_x * 3));
            end
        end 
    end


endmodule