`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/04 21:09:27
// Design Name: 
// Module Name: Tb_YYUSR
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


module Tb_YYUSR();

    parameter size = 4;
    
    wire [size-1:0] par_out;
    
    reg [size-1:0] par_in;
    reg s1;
    reg s0;
    reg msb_in;
    reg lsb_in;
    reg clr;
    reg clk;
    
    USR #(size) tb_U(par_out, clk, clr, s1, s0, lsb_in, msb_in, par_in);
    
    
    initial
    begin
        clr = 1'b0;
        clk = 1'b0;
        s0 = 1'b0;
        s1 = 1'b0;
        par_in[0] = 1'b0;
        par_in[1] = 1'b0;
        par_in[2] = 1'b0;
        par_in[3] = 1'b0;
        lsb_in = 1'b0;
        msb_in = 1'b0;
        forever #10 clk = ~clk;
        
    end
    
    initial
    fork
        #35 s1 = 1'b1;
        #30 clr = 1'b1;
        #35 lsb_in = ~lsb_in;
        #105 lsb_in = ~lsb_in;
        #105 s1 = 1'b0;
        #105 s0 = 1'b1;
        #185 par_in[0] = 1'b1; 
        #185 par_in[1] = 1'b0; 
        #185 par_in[2] = 1'b1; 
        #185 par_in[3] = 1'b0;
        #195 s1 = 1'b1;
        #195 s0 = 1'b1;
        
    join

endmodule
