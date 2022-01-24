`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/24 16:28:22
// Design Name: 
// Module Name: PS
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


module PS #(parameter size = 32)(
    Br,
    D,
    i0,
    i1
    );
    
    output Br;
    output [size-1:0]D;
    input [size-1:0]i0;
    input [size-1:0]i1;
    
    wire [size-1:0]br;
    
    assign Br = br[size-1];
    
    genvar i;
    generate
        for(i=0; i<size; i= i+1)
        begin:FS
            if(i==0)
                FS fa(.B(br[i]), .D(D[i]), .z(1'b0), .x(i0[i]), .y(i1[i]));
            else
                FS fa(.B(br[i]), .D(D[i]), .z(br[i-1]), .x(i0[i]), .y(i1[i]));
        end
    endgenerate
endmodule
