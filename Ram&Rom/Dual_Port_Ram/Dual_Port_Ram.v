`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/09 22:53:33
// Design Name: 
// Module Name: Dual_Port_Ram
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


module Dual_Port_Ram #(parameter MSB = 8, parameter addrsize = 8)(
    rd,
    clk,
    wd,
    ra,
    wa,
    we
    );
    
    parameter depth = 1<<addrsize;
    
    output [MSB-1:0]rd;
    input clk;
    input [MSB-1:0]wd;
    input [addrsize-1:0]ra;
    input [addrsize-1:0]wa;
    input we;
    
    reg [MSB-1:0] ram [0:depth-1];
    
    assign rd = ram[rd];
    
    always@(posedge clk)
    begin
        if(we)
            ram[wa]<=wd;
    end
endmodule
