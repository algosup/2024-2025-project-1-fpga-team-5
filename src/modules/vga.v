module vga_test (
    input i_Clk, // clock 25MHz

    input i_Switch_1,
    input i_Switch_2,
    input i_Switch_3,
    output o_LED_1,

    // VGA
    output o_VGA_HSync, // Horizontal Sync
    output o_VGA_VSync, // Vertical Sync

    output reg [2:0] o_VGA_Red,
    output reg [2:0] o_VGA_Grn,
    output reg [2:0] o_VGA_Blu,

   
);

    

endmodule