`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/06 11:50:45
// Design Name: 
// Module Name: Tb_and
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


module Tb_and;
    reg a,b,c;
    wire o;
    
    G_and sim_and(a,b,c,o);
    
    initial
    begin
    a=0;
    b=0;
    c=0;
    end
    
    initial
    begin
    #100 a=0;b=0;c=0;
    #100 a=1;b=0;c=0;
    #100 a=0;b=1;c=0;
    #100 a=0;b=0;c=1;
    #100 a=1;b=1;c=0;
    #100 a=0;b=1;c=1;
    #100 a=1;b=0;c=1;
    #100 a=1;b=1;c=1;
    end
endmodule
