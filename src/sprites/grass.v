module grass(
    output reg [3:0] grass_arrival,
    output reg [3:0] grass_middle,
    output reg [3:0] grass_spawn,
);

initial begin
	grass_arrival = 1;
    grass_middle = 8;
    grass_spawn = 15;
end

endmodule