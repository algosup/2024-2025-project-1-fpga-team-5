module draw_sprite #(
    parameter TILE_WIDTH = 32,    // Width of the tile in pixels
    parameter TILE_HEIGHT = 32   // Height of the tile in pixels
) (
    input i_Clk,              // Clock signal
    input [4:0] x,            // X coordinate of the pixel (0 to 15)
    input [3:0] y,            // Y coordinate of the pixel (0 to 15)
    input [3:0] sprite,      // 8-bit sprite data;
    output reg [8:0] pixel    // Output 9-bit RGB pixel
);



always @(posedge i_Clk) begin
    // Calculate local pixel coordinates
    


    if (sprite == 4'h1) begin
        pixel <= 9'b111_111_010;
    end else if (sprite == 4'h2) begin
        pixel <= 9'b011_111_010;
    end else if (sprite == 4'h3) begin
        pixel <= 9'b000_000_001;
    end else if (sprite == 4'h4) begin
        pixel <= 9'b111_111_111;
    end else begin
        pixel <= 9'b111_000_111;
    end
    // Calculate the pixel color
    // if (local_pixel_x % 2 == 0) begin
        // pixel <= 9'b000_111_000;
    // end else begin
    //     pixel <= 9'b111_000_111;
    // end
end

endmodule