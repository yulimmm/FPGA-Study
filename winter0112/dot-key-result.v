`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/11 16:52:57
// Design Name: 
// Module Name: dot-key
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


module keydot(
     input clk,
//	  input [1:0] num,
      output  clk_out,
      output data_out,
      output  load,
	input reset_n,
	input I2C_SDAT,
    output  [7:0]SEG,  // given fnd
    output  [3:0]DIGIT,
	output I2C_SCLK
    );


    endmodule