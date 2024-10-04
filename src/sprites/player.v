`include "modules/debounce_switch.v"
module player (
    output reg [9:0] o_player_x,
    output reg [9:0] o_player_y,

    input i_Clk,
    input i_player_up,
    input i_player_down,
    input i_player_left,
    input i_player_right,
);

initial begin
    o_player_x = 10;
    o_player_y = 15;
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
        if (o_player_y > 1) begin
            o_player_y <= o_player_y - 1;
        end
    end else if (w_player_down == 1'b0 && r_player_down == 1'b1) begin
        if (o_player_y < 15) begin
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

    if (o_player_y == 1) begin
        o_player_y <= 15;
        o_player_x <= 10;
    end
end

endmodule