`include "modules/7_segments.v"
module main (
    // Clock
    input i_Clk,

    // 7-segments display
    output reg [6:0] o_Segment1,
    output reg [6:0] o_Segment2,
);
    
    reg [24:0] clock_tick = 0;
    reg [6:0] level = 0;

    always @(posedge i_Clk) begin
        if (clock_tick < 25000000) begin
            clock_tick <= clock_tick + 1;
        end else begin
            // 1 second has passed

            // increment level, TODO: remove this after adding a level increament logic
            if (level == 99) begin
                level <= 0;
            end else begin
                level <= level + 1;
            end
            clock_tick <= 0;
        end
    end

    // display level_counter on 7_segments module
    seven_segments level_counter(
        .counter(level),
        .o_Segment1(o_Segment1),
        .o_Segment2(o_Segment2)
    );


endmodule