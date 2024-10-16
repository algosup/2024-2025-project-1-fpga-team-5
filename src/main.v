// `include "modules/7_segments.v"
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
    output reg [2:0] o_VGA_Blu
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
            end
            clock_tick <= 0;
        end
    end

    // display level_counter on 7_segments module
    // seven_segments level_counter(
    //     .counter(level),
    //     .o_Segment1(o_Segment1),
    //     .o_Segment2(o_Segment2)
    // );


    // VGA module
    // BRAM instantiation using SB_RAM40_4K
    wire [15:0] bram_data_out;
    reg [15:0] bram_data_in;
    reg [10:0] bram_addr;
    reg bram_we;
    SB_RAM40_4K #(
        .INIT_0(256'h0101010101010101010101010101010101010101010101010101010101010101),
        .INIT_1(256'h1010101010101010101010101010101010101010101010101010101010101010),
        .INIT_2(256'h0101010101010101010101010101010101010101010101010101010101010101),
        .INIT_3(256'h1010101010101010101010101010101010101010101010101010101010101010),
        .INIT_4(256'h0101010101010101010101010101010101010101010101010101010101010101),
        .INIT_5(256'h1010101010101010101010101010101010101010101010101010101010101010),
        .INIT_6(256'h0101010101010101010101010101010101010101010101010101010101010101),
        .INIT_7(256'h1010101010101010101010101010101010101010101010101010101010101010),
        .INIT_8(256'h0101010101010101010101010101010101010101010101010101010101010101),
        .INIT_9(256'h1010101010101010101010101010101010101010101010101010101010101010),
        .INIT_A(256'h0101010101010101010101010101010101010101010101010101010101010101),
        .INIT_B(256'h1010101010101010101010101010101010101010101010101010101010101010),
        .INIT_C(256'h0101010101010101010101010101010101010101010101010101010101010101),
        .INIT_D(256'h1010101010101010101010101010101010101010101010101010101010101010),
        .INIT_E(256'h0101010101010101010101010101010101010101010121010101010101010101),
        .INIT_F(256'h101010101010101010101010101010101010101010102010101010101010_1023),
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
    // Color signals for white pixel (RGB = 111 111 111)
    always @(posedge i_Clk) begin
        // Reset color outputs
        o_VGA_Red = 3'b000;
        o_VGA_Grn = 3'b000;
        o_VGA_Blu = 3'b000;

        if (pixel_color) begin
            // Compute the BRAM address: 4 cells per address (4 bits each)
            bram_addr = ((14-(cell_y-1)) * 16) + ((19-(cell_x-1)) / 4);
            
            if (cell_x % 4 == 1) begin
                case (bram_data_out[15:12])
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
            end else if (cell_x % 4 == 2) begin
                case (bram_data_out[11:8])
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
            end else if (cell_x % 4 == 3) begin
                case (bram_data_out[7:4])
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
                case (bram_data_out[3:0])
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
            end
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