//d flip flop 두개 붙어 있는 거 
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/16 22:19:43
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


module sync(
    optr,
    iptr,
    rst,
    clk
    );
    
    output optr;
    input iptr;
    input rst;
    input clk;
    
    reg ptr;
    reg optr;
    
always@(posedge clk, negedge rst_n)
begin
 if(!rst)
     {q2_ptr, ptr_temp} <= 0;

 else
     {q2_ptr, ptr_temp} <= {ptr_temp, ptr};
end
endmodule
