`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/24 15:17:24
// Design Name: 
// Module Name: FS
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


module FS(
   x,
   y,
   z,
   B, //borrow
   D  //difference
    );
    
    output B;
    output D;
    input x;
    input y;
    input z;
    
    assign B = z&~(x^y)+(~x&y);
    assign D = x^y^z;
     
endmodule
