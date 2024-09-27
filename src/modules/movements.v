module movement(
    input i_Clk,

    input i_up,
    input i_down,
    input i_left,
    input i_right,

    output reg o_player_pos_x,
    output reg o_player_pos_y,
);

    always @(posedge i_Clk) begin
        if (i_up) begin
            o_player_pos_y <= o_player_pos_y - 1;
        end
        if (i_down) begin
            o_player_pos_y <= o_player_pos_y + 1;
        end
        if (i_left) begin
            o_player_pos_x <= o_player_pos_x - 1;
        end
        if (i_right) begin
            o_player_pos_x <= o_player_pos_x + 1;
        end
    end

    // always @(posedge i_up) begin
        // o_player_pos_y <= o_player_pos_y - 1;
    // end

    // always @(posedge i_down) begin
    //     o_player_pos_y <= o_player_pos_y + 1;
    // end

    // always @(posedge i_left) begin
    //     o_player_pos_x <= o_player_pos_x - 1;
    // end

    // always @(posedge i_right) begin
    //     o_player_pos_x <= o_player_pos_x + 1;
    // end

endmodule