`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/18 09:49:23
// Design Name: 
// Module Name: Tb_SRlatch
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


module Tb_SRlatch();
    reg s,r;
    wire q,q_;
    
    SRlatch sim_srlatch(.q(q), .q_(q_), .s(s), .r(r));
    
    initial
    begin
    s = 0;
    r = 0;
    end
    
    initial
    begin
    #100 s=1;r=0;
    #100 s=0;r=0;
    #100 s=0;r=1;
    #100 s=0;r=0;
    #100 s=1;r=1;
    end
endmodule
