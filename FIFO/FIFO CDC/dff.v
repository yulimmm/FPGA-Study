`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/23 14:48:33
// Design Name: 
// Module Name: dff
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


module dff#(parameter addrsize = 8)(
    q,
    clk,
    rst_n,
    d
    );
    
    output reg [addrsize:0]q;
    input clk;
    input rst_n;
    input [addrsize:0]d;
    
    always@(posedge clk, negedge rst_n)
    begin
        if(!rst_n)
            q <= 0;
        
        else
            q <= d;
    end
endmodule
