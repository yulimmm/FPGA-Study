`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/18 10:21:19
// Design Name: 
// Module Name: SRlatch2
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


module SRlatch2(
    en,
    s,
    r,
    q,
    q_
    );
    
    input en,s,r;
    output q,q_;
    
    assign q = ~(~(s&en)&q_);
    assign q_ = ~(~(r&en)&q);
    
endmodule
