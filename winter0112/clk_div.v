`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/09 16:15:21
// Design Name: 
// Module Name: clk_div
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


module clk_div
#(
    parameter input_hz = 12000000,
    parameter target_hz = 1000
)
(
    input in_clk,
    output reg out_clk
);

    // make target_hz
    reg [31:0]counter;
    always@(posedge in_clk) begin
        counter <= counter + 1;
        if(counter == (input_hz/(2*target_hz))-1) begin
            out_clk <= ~out_clk;
            counter <= 0;
        end
    end
    
endmodule
