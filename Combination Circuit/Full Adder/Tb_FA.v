`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/07 18:10:53
// Design Name: 
// Module Name: Tb_FA
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


module Tb_FA();
    reg a,b,ci;
    wire s,co;
    
    Full_Adder sim_FA(.a(a), .b(b), .ci(ci), .s(s), .co(co));
    
    initial
    begin
    a = 0;
    b = 0;
    ci = 0;
    end
    
    initial
    begin
    #100 a=0;b=0;ci=0;
    #100 a=0;b=0;ci=1;
    #100 a=0;b=1;ci=0;
    #100 a=0;b=1;ci=1;
    #100 a=1;b=0;ci=0;
    #100 a=1;b=0;ci=1;
    #100 a=1;b=1;ci=0;
    #100 a=1;b=1;ci=1;
    end
    
endmodule
