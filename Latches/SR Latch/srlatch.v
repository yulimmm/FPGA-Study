`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/18 09:35:17
// Design Name: 
// Module Name: SRlatch
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


module SRlatch(
    s,
    r,
    q,
    q_
    );
    input s,r;
    output q,q_;
    
    assign q = ~(r|q_);
    assign q_ = ~(s|q);
endmodule
