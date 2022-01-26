`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/24 22:30:41
// Design Name: 
// Module Name: enc
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


module enc #(parameter size = 4)(
    y1,
    y2,
    v,
    D0,
    D1,
    D2,
    D3
    );
    
    output reg y1;
    output reg y2;
    output reg v;
    input D0;
    input D1;
    input D2;
    input D3;
    
    always@(*)
    begin
        casex({D0, D1, D2, D3})
            4'b0000:
                begin
                    v = 1'b0;
                    y1 = 1'bx;
                    y2 = 1'bx;
                end
            4'b1000:
                begin
                    v = 1'b1;
                    y1 = 1'bz;
                    y2 = 1'b0;
                end
            4'bz100:
                begin
                    v = 1'b1;
                    y1 = 1'bx;
                    y2 = 1'b1;
                end
            4'bzz10:
                begin
                    v = 1'b1;
                    y1 = 1'b1;
                    y2 = 1'bx;
                end
            4'bzzz1:
                begin
                    v = 1'b1;
                    y1 = 1'b1;
                    y2 = 1'b1;
                end
        endcase
    end
endmodule
