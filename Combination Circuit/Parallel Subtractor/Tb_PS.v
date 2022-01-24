`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/24 16:40:59
// Design Name: 
// Module Name: Tb_PS
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


module Tb_PS();
    parameter size = 4;
    
    reg [size-1:0]in0;
    reg [size-1:0]in1;
    
    wire [size:0]distance;
    
    PS #(size) sim_ps(.Br(distance[size]), .D(distance[size-1:0]), .i0(in0), .i1(in1));
    
    integer i;
    
    initial
    begin
        for(i=0; i<2**size; i= i+1)
        begin
            #100 in0 =$urandom%16; in1 = $urandom%16;
        end
    end
endmodule
