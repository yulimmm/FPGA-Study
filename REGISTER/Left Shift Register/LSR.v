`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/04 13:43:51
// Design Name: 
// Module Name: LSR
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


module LSR(
    clk.
    rst,
    ld,
    sin,
    );
    
    input clk;
    input rst;
    input ld;
    input [3:0] din;
    input sin;
    output reg [3:0] q;
    
    always@(posedge clk, posedge rst)
    begin
        if(rst)
            q<=4'b0000;
        else
            if(ld)
                q<=din;
            else
                q<={q[3:1],sin};
    end
endmodule
