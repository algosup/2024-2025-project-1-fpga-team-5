module grass(
    output reg [9:0] grass_arrival_start,
    output reg [9:0] grass_arrival_end,
    output reg [9:0] grass_middle_start,
    output reg [9:0] grass_middle_end,
    output reg [9:0] grass_spawn_start,
    output reg [9:0] grass_spawn_end
);

initial begin
	grass_arrival_start = 0;
	grass_arrival_end = 2;
    grass_middle_start = 8;
    grass_middle_end = 9;
    grass_spawn_start = 15;
    grass_spawn_end = 15;
end

endmodule