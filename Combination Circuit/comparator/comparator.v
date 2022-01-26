`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/24 22:22:43
// Design Name: 
// Module Name: comparator
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


module comparator #(parameter size = 4)(
    equal,
    cat, //a>b
    dog, //b>a
    A,
    B
    );
    
    output equal;
    output cat;
    output dog;
    input [size-1:0]A;
    input [size-1:0]B;
    
    assign equal= ( A == B );
    assign cat = (A>B);
    assign dog = (A<B);
endmodule
