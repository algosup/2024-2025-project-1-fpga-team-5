module draw_sprite #(
    parameter TILE_WIDTH = 32,    // Width of the tile in pixels
    parameter TILE_HEIGHT = 32   // Height of the tile in pixels
) (
    input i_Clk,              // Clock signal
    input [4:0] x,            // X coordinate of the pixel (0 to 15)
    input [3:0] y,            // Y coordinate of the pixel (0 to 15)
    input [0:0] sprite,      // 8-bit sprite data;
    output reg [8:0] pixel    // Output 9-bit RGB pixel
);

// Local pixel coordinates
reg [5:0] local_pixel_x = 0;
reg [5:0] local_pixel_y = 0;


always @(posedge i_Clk) begin
    // Calculate local pixel coordinates
    if (local_pixel_x > 32) begin
        local_pixel_x <= 0;
        if (local_pixel_y > 32) begin
            local_pixel_y <= 0;
        end else begin
            local_pixel_y <= local_pixel_y + 1;
        end
    end else begin
        local_pixel_x <= local_pixel_x + 1;
    end

    // Calculate the pixel color
    if (local_pixel_x % 2 == 0) begin
        pixel <= 9'b000_111_111;
    end else begin
        pixel <= 9'b111_000_111;
    end
end

endmodule