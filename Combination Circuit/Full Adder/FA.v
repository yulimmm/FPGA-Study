`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/07 17:17:13
// Design Name: 
// Module Name: Full_Adder
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


module Full_Adder(
    a,
    b,
    ci,
    s,
    co
    );
    
    input a,b,ci;
    output s,co;
    
    assign s = (a^b)^ci;
    assign co = (a&b)|{(a^b)&ci};
     
endmodule
