`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/23 15:03:16
// Design Name: 
// Module Name: flag_full
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


module flag_full#(parameter addrsize = 8)(
    full,
    clk,
    rst_n,
    ptr,
    q2_ptr
    );
    
    output reg full;
    input clk;
    input rst_n;
    input [addrsize:0]ptr;
    input [addrsize:0]q2_ptr;
    
    always@(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
        begin
            full <= 1'b0;
        end
        
        else
        begin
            full <= (ptr == {~q2_ptr[addrsize:addrsize-1], q2_ptr[addrsize-2:0]});
        end
    end
endmodule
