`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/06 11:46:02
// Design Name: 
// Module Name: G_and
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


module G_and(
    A,
    B,
    C,
    out
    );
    
    input A,B,C;
    output out;
    
    assign out = A&B&C;
endmodule
