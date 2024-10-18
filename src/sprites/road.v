module road(
    output reg [3:0] road_top_start,
    output reg [3:0] road_top_end,
    output reg [3:0] road_bottom_start,
    output reg [3:0] road_bottom_end
);

initial begin
	road_top_start = 3;
	road_top_end = 8;
    road_bottom_start = 9;
    road_bottom_end = 14;
end

endmodule