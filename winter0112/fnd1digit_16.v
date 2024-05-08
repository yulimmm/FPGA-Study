`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/09 12:15:12
// Design Name: 
// Module Name: fnd
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


module fnd1digit_16(
    output  [7:0]SEG,  // given fnd
    output  [3:0]DIGIT,
    input [3:0]hexValue,
    input nokey,  // input for key press status (1: no key 0: key pressed)
    input clk
    );
    
reg [3:0] DIGIT_r = 4'he;
reg [7:0] SEG_r;
wire clkdigit;
clk_div #(.target_hz(240)) clk1 (.in_clk(clk), .out_clk(clkdigit));
always@(posedge clkdigit) begin

    case(DIGIT_r)
        4'he: DIGIT_r <= 4'hd;
        4'hd: DIGIT_r <= 4'hb;
        4'hb: DIGIT_r <= 4'h7;
        4'h7: DIGIT_r <= 4'he;
    endcase
end

    
always@(posedge clk) begin
// key pressed situation:  Turn On given FND
if (nokey != 1'b1) begin   
    case(DIGIT_r)
        4'he: begin
            case(hexValue)
                  4'h0: SEG_r <= 8'hfc;
                  4'h1: SEG_r <= 8'h60;
                  4'h2: SEG_r <= 8'hda;
                  4'h3: SEG_r <= 8'hf2;
                  4'h4: SEG_r <= 8'h66;
                  4'h5: SEG_r <= 8'hb6;
                  4'h6: SEG_r <= 8'hbe;
                  4'h7: SEG_r <= 8'he0;
                  4'h8: SEG_r <= 8'hfe;
                  4'h9: SEG_r <= 8'he6;
                  4'ha: SEG_r <= 8'hee;
                  4'hb: SEG_r <= 8'h3e;
                  4'hc: SEG_r <= 8'h9c;
                  4'hd: SEG_r <= 8'h7a;
                  4'he: SEG_r <= 8'h9e;
                  4'hf: SEG_r <= 8'h8e;
				  default: SEG_r <= 8'h02;
            endcase
            end
        4'hd: SEG_r <= 8'h00;
        4'hb: SEG_r <= 8'h00;
        4'h7: SEG_r <= 8'h00;
    endcase
    end
// no key pressed situation:  Turn Off given FND
else
    SEG_r <= 8'h00;
end
assign SEG = SEG_r;
assign DIGIT = DIGIT_r;
endmodule
