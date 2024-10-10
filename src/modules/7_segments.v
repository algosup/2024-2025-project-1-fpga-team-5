module seven_segments (
    // counter
    input [6:0] counter,
    // 7-segments display
    output reg [6:0] o_Segment1,
    output reg [6:0] o_Segment2,
);
    
    always @(*) begin
        case (counter/10) 
            1: o_Segment1 = 7'b1111001; // 1
            2: o_Segment1 = 7'b0100100; // 2
            3: o_Segment1 = 7'b0110000; // 3
            4: o_Segment1 = 7'b0011001; // 4
            5: o_Segment1 = 7'b0010010; // 5
            6: o_Segment1 = 7'b0000010; // 6
            7: o_Segment1 = 7'b1111000; // 7
            8: o_Segment1 = 7'b0000000; // 8
            9: o_Segment1 = 7'b0010000; // 9
            default: o_Segment1 = 7'b1000000; // 0
        endcase

        case (counter%10) 
            1: o_Segment2 = 7'b1111001; // 1
            2: o_Segment2 = 7'b0100100; // 2
            3: o_Segment2 = 7'b0110000; // 3
            4: o_Segment2 = 7'b0011001; // 4
            5: o_Segment2 = 7'b0010010; // 5
            6: o_Segment2 = 7'b0000010; // 6
            7: o_Segment2 = 7'b1111000; // 7
            8: o_Segment2 = 7'b0000000; // 8
            9: o_Segment2 = 7'b0010000; // 9
            default: o_Segment2 = 7'b1000000; // 0
        endcase
    end // always @(*)

endmodule