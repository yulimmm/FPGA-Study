`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/21 22:20:51
// Design Name: 
// Module Name: sync
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

module sync #(parameter addrsize = 4)(
    q2_ptr,
    clk,
    rst_n,
    ptr
    );
    
    output [addrsize:0]q2_ptr;
    input clk;
    input rst_n;
    input [addrsize:0] ptr;
    
    wire [addrsize:0]q1_ptr;
    
    D_FF sync0(.q(q1_ptr), .q_(), .pre_n(), .clk(clk), .clr_n(rst_n), .d(ptr) );
    D_FF sync1(.q(q2_ptr),.q_(), .pre_n(), .clk(clk), .clr_n(rst_n), .d(q1_ptr) );
    
endmodule
