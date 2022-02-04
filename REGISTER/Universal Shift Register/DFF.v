`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/04 18:39:47
// Design Name: 
// Module Name: DFF
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


module DFF(
    Q,
    D,
    clr,
    Clk
    );
    
    output Q;
    input Clk;
    input clr;
    input D;
    
    wire Q1;
    
    assign Q1 = ~(~(Q1 & ~(~D & Clk) & clr) & ~(D & Clk));
    assign Q = ~(~(Q & ~(~Q1 & ~Clk) & clr) & ~(Q1 & ~Clk));
    
endmodule
