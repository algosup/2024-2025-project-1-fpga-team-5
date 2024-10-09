module car #(parameter CAR_START = 1, parameter CAR_SPEED = 1, parameter CAR_DIRECTION = 1) (
    input i_Clk, // clock 25MHz

    output reg [4:0] o_car_x,
);

reg [0:0] init_car_x;

initial begin
    init_car_x = 1'b0;
end

reg [22:0] clock_tick; // Assuming 24 bits is enough to count to 12500000

always @(posedge i_Clk) begin
    // Initialize car position on reset
    if (!init_car_x) begin
        o_car_x <= CAR_START;   
        init_car_x <= 1'b1;
    end

    // Increment clock_tick for timing
    if (clock_tick < 6250000) begin
        clock_tick <= clock_tick + 1;
    end else begin
        // Reset clock_tick and update car position
        clock_tick <= 0;

        // Move car in the specified direction
        if (CAR_DIRECTION) begin // If CAR_DIRECTION is 1
            if (o_car_x < 20) begin
                o_car_x <= o_car_x + CAR_SPEED;
            end else begin
                o_car_x <= 0;
            end
        end else begin // If CAR_DIRECTION is 0
            if (o_car_x > 0) begin
                o_car_x <= o_car_x - CAR_SPEED;
            end else begin
                o_car_x <= 20;
            end
        end
    end
end


endmodule