module car(
    input i_Clk, // clock 25MHz

    input [4:0] i_car_x,
    output reg [4:0] o_car_x,
);

initial begin
    init_car_x = 1'b0;
end

reg [23:0] clock_tick = 0;

always @(posedge i_Clk) begin
    if (init_car_x == 1'b0) begin
        o_car_x = i_car_x;   
        init_car_x = 1'b1;
    end
    if (clock_tick < 12500000) begin // 0.5 second
        clock_tick <= clock_tick + 1;
    end else begin
        // 1 second has passed
        clock_tick <= 0;
        if (o_car_x < 20) begin
            o_car_x <= o_car_x + 1;
        end else begin
            o_car_x <= 0;
        end
    end
end

endmodule