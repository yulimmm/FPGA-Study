`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/24 23:12:43
// Design Name: 
// Module Name: Tb_BGCONV
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


module Tb_BGCONV();
    parameter size = 4;
    
    reg [size-1:0]bin;
    wire [size-1:0]gray;
    
    BG_CONV #(size) sim(gray, bin);
    
    integer i;
    
    initial
    begin
        bin = 0;
        
        for(i=0; i<2**size; i=0+1)
            #100 bin = bin + 1;
    end
endmodule
