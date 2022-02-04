`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/04 18:23:26
// Design Name: 
// Module Name: M41
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


module M41(o, a, b, c, d, s0, s1);

    output o;
    input a, b, c, d, s0, s1;
    wire T1, T2, T3, T4;
    
    and (T1, a, ~s0, ~s1), (T2, b, ~s0, s1), (T3, c, s0, ~s1), (T4, d, s0, s1);
    or(o, T1, T2, T3, T4);
    
endmodule
