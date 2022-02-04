`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/04 14:12:45
// Design Name: 
// Module Name: USR
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

module USR(
    clk,
    rst,
    sin
    );
    
    input clk;
    input rst;
    input [1:0]s;
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
                if(s==2'b01)
                    q<={sin,q[2:0]};
                 else if(s==2'b10)
                    q<={q[3:1],sin};
                 else if(s==2'b11)
                    q<=din;
    end
endmodule
