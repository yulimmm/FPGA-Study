`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/24 23:22:12
// Design Name: 
// Module Name: GB_CONV
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


module GB_CONV#(parameter size = 4)(
    bin,
    gray
    );
    
    output [size-1:0]bin;
    input [size-1:0]gray;
    
    genvar i;
    
    for(i=0; i<size; i=i+1)
    begin
        assign bin[i] =^ (gray>>1);
    end
endmodule
