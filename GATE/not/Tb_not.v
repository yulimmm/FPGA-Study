`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/06 11:04:34
// Design Name: 
// Module Name: Tb_NOT
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


module Tb_NOT;
    reg z;
    wire j;
    
    NOT sim_NOT(z,j);
    
    initial
    begin
    z = 0;
    end
    
    initial
    begin
    #100 z=0;
    #100 z=1;
    end
    
endmodule
