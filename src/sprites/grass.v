module grass(
    output reg [9:0] grass_arrival_start,
    output reg [9:0] grass_arrival_end,
    output reg [9:0] grass_spawn_start,
    output reg [9:0] grass_spawn_end
);

initial begin
	grass_arrival_start = 0;
	grass_arrival_end = 3;
    grass_spawn_start = 13;
    grass_spawn_end = 15;
end

endmodule