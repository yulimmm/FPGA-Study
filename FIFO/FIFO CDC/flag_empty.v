`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/23 15:02:18
// Design Name: 
// Module Name: flag_empty
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


module flag_empty #(parameter addrsize = 8)(
    empty,
    clk,
    rst_n,
    ptr,
    q2_ptr
    );
    
    output reg empty;
    input clk;
    input rst_n;
    input [addrsize:0]ptr;
    input [addrsize:0]q2_ptr;
    
    always@(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
        begin
            empty <= 1'b1;
        end
        
        else
        begin
            empty <= (ptr == q2_ptr);
        end
    end
endmodule
