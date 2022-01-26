`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/24 23:06:50
// Design Name: 
// Module Name: BG_CONV
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


module BG_CONV #(parameter size = 4)(
    gray,
    bin
    );
    
    output [size-1:0]gray;
    input [size-1:0]bin;
    
    // wire bin_next = bin >> 1; 보기 좋게 하는 법

    assign gray = (bin >> 1) ^ bin;
endmodule
