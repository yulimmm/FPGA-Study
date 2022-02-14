`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/14 17:05:44
// Design Name: 
// Module Name: sync_fifo
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


module sync_fifo(
    clk.
    reset,
    //write
    write_en,
    write_data,
    //read
    emtpy,
    read_en,
    read_data
    );
    
    input clk, reset;
    //write
    output full;
    input write_en;
    input [7:0]write_data;
    //read 
    output empty;
    input read_en;
    input [7:0] read_data;   
    
endmodule
