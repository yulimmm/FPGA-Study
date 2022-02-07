`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/07 17:25:50
// Design Name: 
// Module Name: Tb_HA
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


module Tb_HA();
    reg a,b;
    wire c,s;
    
    Half_Adder sim_HA(.a(a), .b(b), .c(c), .s(s));
    
    initial
    begin
    a = 0;
    b = 0;
    end
    
    initial
    begin
    #100 a=0;b=0;
    #100 a=1;b=0;
    #100 a=0;b=1;
    #100 a=1;b=1;
    end
    
endmodule
