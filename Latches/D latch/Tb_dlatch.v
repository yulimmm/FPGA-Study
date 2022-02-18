`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/18 10:48:21
// Design Name: 
// Module Name: Tb_dlatch
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


module Tb_dlatch();
    reg en,d;
    wire q,q_;
    
    Dlatch sim_dlatch(.q(q), .q_(q_), .en(en), .d(d));
    
    initial
    begin
    en = 0;
    d = 0;
    end
    
    initial
    begin
    #100 en=0;d=0;
    #100 en=1;d=0;
    #100 en=0;d=1;
    #100 en=1;d=1;
    end
endmodule
