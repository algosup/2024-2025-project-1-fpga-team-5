`include "modules/debounce_switch.v"
`include "modules/draw_sprite.v"
module player #(parameter PLAYER_ORIGIN_X = 11, parameter PLAYER_ORIGIN_Y = 14) (
    output reg [4:0] o_player_x,
    output reg [3:0] o_player_y,
    output reg o_reset,
    output wire [8:0] player_color,

    input i_Clk,
    input i_player_up,
    input i_player_down,
    input i_player_left,
    input i_player_right,
    input i_reset
);

initial begin
    o_player_x = PLAYER_ORIGIN_X;
    o_player_y = PLAYER_ORIGIN_Y;
end

reg  r_player_up = 1'b0;
wire w_player_up;
reg  r_player_down = 1'b0;
wire w_player_down;
reg  r_player_left = 1'b0;
wire w_player_left;
reg  r_player_right = 1'b0;
wire w_player_right;

Debounce_Switch Debounce_Inst_up
(.i_Clk(i_Clk), 
.i_Switch(i_player_up),
.o_Switch(w_player_up));

Debounce_Switch Debounce_Inst_down
(.i_Clk(i_Clk),
.i_Switch(i_player_down),
.o_Switch(w_player_down));

Debounce_Switch Debounce_Inst_left
(.i_Clk(i_Clk),
.i_Switch(i_player_left),
.o_Switch(w_player_left));

Debounce_Switch Debounce_Inst_right
(.i_Clk(i_Clk),
.i_Switch(i_player_right),
.o_Switch(w_player_right));

// Additional logic for player module can  go here
always @(posedge i_Clk) begin
    r_player_up <= w_player_up;
    r_player_down <= w_player_down;
    r_player_left <= w_player_left;
    r_player_right <= w_player_right;

    if (w_player_up == 1'b0 && r_player_up == 1'b1) begin
        if (o_player_y > 0) begin
            o_player_y <= o_player_y - 1;
        end
    end else if (w_player_down == 1'b0 && r_player_down == 1'b1) begin
        if (o_player_y < 14) begin
            o_player_y <= o_player_y + 1;
        end
    end else if (w_player_left == 1'b0 && r_player_left == 1'b1) begin
        if (o_player_x > 1) begin
            o_player_x <= o_player_x - 1;
        end
    end else if (w_player_right == 1'b0 && r_player_right == 1'b1) begin
        if (o_player_x < 20) begin
            o_player_x <= o_player_x + 1;
        end
    end

    if (i_reset == 1) begin
        o_reset <= 1;
        o_player_x <= PLAYER_ORIGIN_X;
        o_player_y <= PLAYER_ORIGIN_Y;
    end else begin
        o_reset <= 0;
    end

    if (o_player_y == 0) begin
        o_player_y <= PLAYER_ORIGIN_Y;
        o_player_x <= PLAYER_ORIGIN_X;
    end
end

// BRAM instantiation using SB_RAM40_4K
    wire [15:0] bram_data_out;
    reg [10:0] bram_addr;
    reg bram_we = 1'b0;
    reg bram_re = 1'b1;
    // Actually address avec the underscore are used for the map but for unknown reason, 11 addresses before aren't accessible
SB_RAM40_4K #(
    .INIT_0(256'h00000000000000000000000000000000000000000000_33333333333333333321),
    .INIT_1(256'h00000000000000000000000000000000000000000000_11111111111111111111),
    .INIT_2(256'h00000000000000000000000000000000000000000000_22222222222222222222),
    .INIT_3(256'h00000000000000000000000000000000000000000000_22222222222222222222),
    .INIT_4(256'h00000000000000000000000000000000000000000000_22222222222222222222),
    .INIT_5(256'h00000000000000000000000000000000000000000000_22222222222222222222),
    .INIT_6(256'h00000000000000000000000000000000000000000000_22222222222222222222),
    .INIT_7(256'h00000000000000000000000000000000000000000000_11111111111111111111),
    .INIT_8(256'h00000000000000000000000000000000000000000000_22222222222222222222),
    .INIT_9(256'h00000000000000000000000000000000000000000000_22222222222222222222),
    .INIT_A(256'h00000000000000000000000000000000000000000000_22222222222222222222),
    .INIT_B(256'h00000000000000000000000000000000000000000000_22222222222222222222),
    .INIT_C(256'h00000000000000000000000000000000000000000000_22222222222222222222),
    .INIT_D(256'h00000000000000000000000000000000000000000000_11111111111111111111),
    .INIT_E(256'h00000000000000000000000000000000000000000000_11111111111111111111),
    .WRITE_MODE(0),
    .READ_MODE(0)
) player_inst (
    .RDATA(bram_data_out),
    .RADDR(bram_addr),
    .RCLK(i_Clk),
    .RCLKE(1'b1),
    .RE(bram_re),
    .WADDR(bram_addr),
    .WCLK(i_Clk),
    .WCLKE(1'b1),
    .WE(bram_we)
);

always @(posedge i_Clk) begin
    bram_addr <= 1;//{o_player_y, o_player_x};
end

draw_sprite player_sprite (
    .i_Clk(i_Clk),
    .x(o_player_x),
    .y(o_player_y),
    .sprite(bram_data_out),
    .pixel(player_color)
);

endmodule