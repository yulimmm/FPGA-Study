`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/18 10:08:07
// Design Name: 
// Module Name: Dlatch
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


module Dlatch(
    d,
    en,
    q,
    q_
    );
    input d, en;
    output q,q_;
    
    assign q = ~(~(d&en)&q_);
    assign q_ = ~(~(~d&en)&q);
    
endmodule
