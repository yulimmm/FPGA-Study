`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/23 14:43:43
// Design Name: 
// Module Name: address_pointer
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


module address_pointer#(parameter addrsize = 8)(
    addr, 
    ptr,
    clk,
    rst_n,
    state,
    c
    );
    
    output [addrsize-1:0]addr;
    output reg [addrsize:0]ptr;
    input clk;
    input rst_n;
    input state;
    input c;
    
    reg [addrsize:0]ptr_bin;
    wire [addrsize:0]ptr_bin_next = ptr_bin + (~state & c);
    wire [addrsize:0]ptr_gray_next = (ptr_bin_next >> 1) ^ ptr_bin_next;
    
    assign addr = ptr_bin[addrsize-1:0];
    
    always@(posedge clk, negedge rst_n)
    begin
        if(!rst_n)
        begin
            ptr_bin <= 0;
            ptr <= 0;
        end
        
        else
        begin
            ptr_bin <= ptr_bin_next;
            ptr <= ptr_gray_next;
        end
    end
endmodule
