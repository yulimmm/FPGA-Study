`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/24 15:42:59
// Design Name: 
// Module Name: Tb_FS
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


module Tb_FS();
    reg x;
    reg y;
    reg z;
    
    wire [1:0]s;
    
    FS sim_FS(.B(s[1]), .D(s[0]), .x(x), .y(y), .z(z));
    initial
    begin
        x = 1'b0;
        y = 1'b0;
        z = 1'b0;
    end
    
    initial
    begin
        #100 x=1'b0;  y=1'b0;  z=1'b1;
        #100 x=1'b0;  y=1'b1;  z=1'b0;
        #100 x=1'b0;  y=1'b1;  z=1'b1;
        #100 x=1'b1;  y=1'b0;  z=1'b1;
        #100 x=1'b1;  y=1'b1;  z=1'b0;
        #100 x=1'b1;  y=1'b1;  z=1'b1;
    end
endmodule
