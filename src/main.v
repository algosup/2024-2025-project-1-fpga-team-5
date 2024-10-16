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
    wire [3:0] grass_middle;
    wire [3:0] grass_spawn_start;
    wire [3:0] grass_spawn_end;
    grass grass_module (
        .grass_arrival_start(grass_arrival_start),
        .grass_arrival_end(grass_arrival_end),
        .grass_middle(grass_middle),
        .grass_spawn_start(grass_spawn_start),
        .grass_spawn_end(grass_spawn_end)
    );


    // Car module
    // TODO: Find a way to clean this up
    wire [4:0] car2_x;
    wire [3:0] car2_y = 3;
    car #(.CAR_START(15), .CAR_SPEED(3), .CAR_DIRECTION(0)) car2_module (
        .i_Clk(i_Clk),
        .o_car_x(car2_x),
    );

    wire [4:0] car3_x;
    wire [3:0] car3_y = 4;
    car #(.CAR_START(17), .CAR_SPEED(2)) car3_module (
        .i_Clk(i_Clk),
        .o_car_x(car3_x),
    );


    wire [4:0] car4_x;
    wire [3:0] car4_y = 5;
    car #(.CAR_START(9), .CAR_SPEED(2)) car4_module (
        .i_Clk(i_Clk),
        .o_car_x(car4_x),
    );

    wire [4:0] car5_x;
    wire [3:0] car5_y = 6;
    car #(.CAR_START(10), .CAR_SPEED(3), .CAR_DIRECTION(0)) car5_module (
        .i_Clk(i_Clk),
        .o_car_x(car5_x),
    );


    wire [4:0] car6_x;
    wire [3:0] car6_y = 7;
    car #(.CAR_START(7), .CAR_SPEED(1), .CAR_DIRECTION(0)) car6_module (
        .i_Clk(i_Clk),
        .o_car_x(car6_x),
    );
    

    wire [4:0] car7_x;
    wire [3:0] car7_y = 10;
    car #(.CAR_START(12), .CAR_SPEED(1)) car7_module (
        .i_Clk(i_Clk),
        .o_car_x(car7_x),
    );


    wire [4:0] car8_x;
    wire [3:0] car8_y = 11;
    car #(.CAR_START(20), .CAR_SPEED(1)) car8_module (
        .i_Clk(i_Clk),
        .o_car_x(car8_x),
    );

    wire [4:0] car9_x;
    wire [3:0] car9_y = 12;
    car #(.CAR_START(19), .CAR_SPEED(1))car9_module (
        .i_Clk(i_Clk),
        .o_car_x(car9_x),
    );


    wire [4:0] car10_x;
    wire [3:0] car10_y = 13;
    car #(.CAR_START(6), .CAR_SPEED(1)) car10_module (
        .i_Clk(i_Clk),
        .o_car_x(car10_x),
    );

    wire [4:0] car12_x;
    wire [3:0] car12_y = 9;
    car #(.CAR_START(2), .CAR_SPEED(3), .CAR_DIRECTION(0)) car12_module (
        .i_Clk(i_Clk),
        .o_car_x(car12_x),
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
            if ((car2_x == cell_x && car2_y == cell_y)
                    || (car3_x == cell_x && car3_y == cell_y)
                    || ((car4_x == cell_x || car4_x-1 == cell_x) && car4_y == cell_y)
                    || (car5_x == cell_x && car5_y == cell_y)
                    || ((car6_x == cell_x || car6_x+1 == cell_x) && car6_y == cell_y)
                    || (car7_x == cell_x && car7_y == cell_y)
                    || ((car8_x == cell_x || car8_x-1 == cell_x) && car8_y == cell_y)
                    || ((car9_x == cell_x || car9_x-1 == cell_x) && car9_y == cell_y)
                    || (car10_x == cell_x && car10_y == cell_y)
                    || (car12_x == cell_x && car12_y == cell_y)
            ) begin
                o_VGA_Red <= 3'b111; o_VGA_Grn <= 3'b000; o_VGA_Blu <= 3'b000; // Car
                if (cell_x == player_x && cell_y == player_y) begin
                    i_reset <= 1;
                end
            end else if (cell_x == player_x && cell_y == player_y) begin
                o_VGA_Red <= 3'b000; o_VGA_Grn <= 3'b000; o_VGA_Blu <= 3'b111; // Player
            end else if ((cell_y >= road_top_start && cell_y < road_top_end) || (cell_y >= road_bottom_start && cell_y < road_bottom_end )) begin
                o_VGA_Red <= 3'b001; o_VGA_Grn <= 3'b001; o_VGA_Blu <= 3'b001; // Roads
            end else if ((cell_y >= grass_arrival_start && cell_y <= grass_arrival_end)
                        || (cell_y == grass_middle)
                        || (cell_y >= grass_spawn_start && cell_y <= grass_spawn_end)
            ) begin
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
    // VGA module
    // BRAM instantiation using SB_RAM40_4K
    wire [15:0] bram_data_out;
    reg [15:0] bram_data_in;
    reg [10:0] bram_addr;
    reg bram_we;
    // Actually address avec the underscore are used for the map but for unknown reason, 11 addresses before aren't accessible
    SB_RAM40_4K #(
        .INIT_0(256'h01010101010101010101010101010101010101010101_01010101010101010101),
        .INIT_1(256'h10101010101010101010101010101010101010101010_10101010101010101010),
        .INIT_2(256'h01010101010101010101010101010101010101010101_01010101010101010101),
        .INIT_3(256'h10101010101010101010101010101010101010101010_10101010101010101010),
        .INIT_4(256'h01010101010101010101010101010101010101010101_01010101010101010101),
        .INIT_5(256'h10101010101010101010101010101010101010101010_10101010101010101010),
        .INIT_6(256'h01010101010101010101010101010101010101010101_01010101010101010101),
        .INIT_7(256'h10101010101010101010101010101010101010101010_10101010101010101010),
        .INIT_8(256'h01010101010101010101010101010101010101010101_01010101010101010101),
        .INIT_9(256'h10101010101010101010101010101010101010101010_10101010101010101010),
        .INIT_A(256'h01010101010101010101010101010101010101010101_01010101010101010101),
        .INIT_B(256'h10101010101010101010101010101010101010101010_10101010101010101010),
        .INIT_C(256'h01010101010101010101010101010101010101010101_01010101010101010101),
        .INIT_D(256'h10101010101010101010101010101010101010101010_10101010101010101010),
        .INIT_E(256'h01010101010101010101010101010101010101010101_21010101010101010101),
        .WRITE_MODE(0),
        .READ_MODE(0)
    ) bram_inst (
        .RDATA(bram_data_out),
        .RADDR(bram_addr),
        .RCLK(i_Clk),
        .RCLKE(1'b1),
        .RE(1'b1),
        .WADDR(bram_addr),
        .WCLK(i_Clk),
        .WCLKE(1'b1),
        .WDATA(bram_data_in),
        .WE(bram_we)
    );
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
    reg [9:0] tile_size = 32;
    reg [4:0] cell_x = 0;
    reg [4:0] cell_y = 0;
    // Color output logic: Color only the left half of the screen
    wire pixel_color;
    assign pixel_color = (h_active && v_active && (h_counter < H_SYNC_CYCLES + H_BACK_PORCH + H_DISPLAY) && (v_counter < V_SYNC_CYCLES + V_BACK_PORCH + V_DISPLAY));

    reg [3:0] tile = 0;
    // Color signals for white pixel (RGB = 111 111 111)
    always @(posedge i_Clk) begin
        if (pixel_color) begin
            // Compute the BRAM address: 4 cells (4 bits each) per address (16 bits)
            bram_addr = (((cell_y)) * 16) + ((20-(cell_x)) / 4);

            if (cell_x % 4 == 1) begin
                tile = bram_data_out[15:12];
            end else if (cell_x % 4 == 2) begin
                tile = bram_data_out[11:8];
            end else if (cell_x % 4 == 3) begin
                tile = bram_data_out[7:4];
            end else begin
                tile = bram_data_out[3:0];
            end

            case (tile)
                4'b0000: begin
                    o_VGA_Red = 3'b111; o_VGA_Grn = 3'b000; o_VGA_Blu = 3'b000; // Red
                end
                4'b0001: begin
                    o_VGA_Red = 3'b000; o_VGA_Grn = 3'b111; o_VGA_Blu = 3'b000; // Green
                end
                4'b0010: begin
                    o_VGA_Red = 3'b000; o_VGA_Grn = 3'b000; o_VGA_Blu = 3'b111; // Blue
                end
                default: begin
                    o_VGA_Red = 3'b000; o_VGA_Grn = 3'b000; o_VGA_Blu = 3'b000; // Black
                end
            endcase
        end else begin
            // If not displaying color, set all outputs to black
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

endmodule