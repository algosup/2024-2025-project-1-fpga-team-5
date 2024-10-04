module road(
    output reg [9:0] road_start,
    output reg [9:0] road_end
);

initial begin
	road_start = 3;
	road_end = 13;
end

endmodule