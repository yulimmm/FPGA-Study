`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/24 23:41:57
// Design Name: 
// Module Name: Tb_GBCONV
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


module TB_GBCONV();
    parameter size = 4;
    
    wire  [size-1:0]bin;
    reg  [size-1:0]gray;
    
    GB_CONV #(size) sim(bin, gray);
    
    initial
    begin        
            gray = 4'b0000;
        #50 gray = 4'b0001;
        #50 gray = 4'b0011;
        #50 gray = 4'b0010;
        #50 gray = 4'b0110;
        #50 gray = 4'b0111;
        #50 gray = 4'b0101;
        #50 gray = 4'b0100;
        #50 gray = 4'b1100;
        #50 gray = 4'b1101;
        #50 gray = 4'b1111;
        #50 gray = 4'b1110;
        #50 gray = 4'b1010;
        #50 gray = 4'b1011;
        #50 gray = 4'b1001;
        #50 gray = 4'b1000;
    end
endmodule
