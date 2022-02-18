`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/18 10:30:58
// Design Name: 
// Module Name: Tb_srlatch2
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


module Tb_srlatch2();
    reg en,s,r;
    wire q,q_;
    
    SRlatch2 sim_srlatch2(.q(q), .q_(q_), .en(en), .s(s), .r(r));
    
    initial
    begin
    en = 0;
    s = 0;
    r = 0;
    end
    
    initial
    begin
    #100 en=0;s=0;r=0;
    #100 en=0;s=0;r=1;
    #100 en=1;s=0;r=0;
    #100 en=1;s=0;r=1;
    #100 en=1;s=1;r=0;
    #100 en=1;s=1;r=1;
    end
endmodule
