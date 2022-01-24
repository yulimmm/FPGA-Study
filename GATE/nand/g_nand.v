`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/19 23:19:09
// Design Name: 
// Module Name: g_nand
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//structural model
module g_nand(
    y,
    a,
    b,
    c
    );
    
    output y;
    input a,b,c;
    
//       o i i i
    nand(y,a,b,c);

endmodule


//data flow model
module g_nand_data(
    y,
    a,
    b,
    c
    );
    output y;
    input a,b,c;
    
    assign y = ~ ( a & b & c );
    
endmodule

//behavioral model
module g_nand_be(
    y,
    a,
    b,
    c
    );
    output reg y;
    input a,b,c;
    
    always@(*)
    begin
        case({a,b,c})
            3'b000:y<=1'b1;
            3'b001:y<=1'b1;
            3'b010:y<=1'b1;
            3'b011:y<=1'b1;
            3'b100:y<=1'b1;
            3'b101:y<=1'b1;
            3'b110:y<=1'b1;
            3'b111:y<=1'b0;
         endcase
    end
endmodule
