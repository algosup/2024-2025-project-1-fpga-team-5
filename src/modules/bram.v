module ram_single_port
#(
    parameter DATA_WIDTH = 60,    // Width of each memory word
    parameter ADDR_WIDTH = 4      // Address width to support up to 2^ADDR_WIDTH locations
)
(
    input wire clk,               // Clock signal
    input wire [ADDR_WIDTH-1:0] addr,   // Address input
    input wire [DATA_WIDTH-1:0] din,    // Data input for write operation
    input wire we,                // Write enable signal
    output reg [DATA_WIDTH-1:0] dout   // Data output for read operation
);

    // Declare the RAM variable (synthesized into BRAM on FPGAs)
    reg [DATA_WIDTH-1:0] ram [2**ADDR_WIDTH-1:0];

    always @(posedge clk) begin
        if (we) begin
            // Write operation
            ram[addr] <= din;
        end
        // Read operation
        dout <= ram[addr];
    end

endmodule
