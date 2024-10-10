module grass(
    output reg [3:0] grass_arrival_start,
    output reg [3:0] grass_arrival_end,
    output reg [3:0] grass_middle,
    output reg [3:0] grass_spawn_start,
    output reg [3:0] grass_spawn_end
);

initial begin
    grass_arrival_start = 1;
	grass_arrival_end = 2;
    grass_middle = 8;
    grass_spawn_start = 14;
    grass_spawn_end = 15;
end

endmodule