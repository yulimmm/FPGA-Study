`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/04 14:12:45
// Design Name: 
// Module Name: USR
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

module USR #(parameter size=4) (
    o,
    clk,
    clear_n,
    sel0,
    sel1,
    left,
    right,
    i
    );
    
    output [size-1:0]o;
    input clk;
    input clear_n;
    input sel0;
    input sel1;
    input left;
    input right;
    input [size-1:0]i;
    
    wire [size-1:0]muxo;
        
    genvar v;
    generate
        for(v=0; v<size; v=v+1)
        begin : USR
            if(v == 0) 
            begin : MUX 
                M41 mux(.o(muxo[v]), .s0(sel0), .s1(sel1), .a(o[v]), .b(o[v+1]), .c(left), .d(i[v]));
            end
                        
            else if(v == size-1)
            begin : MUX
                M41 mux(.o(muxo[v]), .s0(sel0), .s1(sel1), .a(o[v]), .b(right), .c(o[v-1]), .d(i[v]));
            end
            
            else
            begin : MUX
                M41 mux(.o(muxo[v]), .s0(sel0), .s1(sel1), .a(o[v]), .b(o[v+1]), .c(o[v-1]), .d(i[v]));
            end
            
            DFF DFF(.Q(o[v]), .Clk(clk), .clr(clear_n), .D(muxo[v]));
        end
    endgenerate
    
endmodule
