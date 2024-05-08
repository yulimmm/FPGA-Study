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


module fnd4digit(
    output reg [7:0]jx,  // given fnd
    output reg [3:0]jd,
    input [3:0]hexValue,
    input [3:0]hexValue2,
	input [3:0]hexValue3,
	input [3:0]hexValue4,
    input clk
    );
    
reg jd = 4'he;
wire clkdigit;
//wire [3:0] hexValue3;
//wire [3:0] hexValue4;
clk_div #(.target_hz(240)) clk1 (.in_clk(clk), .out_clk(clkdigit));
//assign hexValue3 = hexValue;
//assign hexValue4 = hexValue2;
always@(posedge clkdigit) begin  // right to left
        case(jd)
            4'he: jd <= 4'hd;
            4'hd: jd <= 4'hb;
            4'hb: jd <= 4'h7;
            4'h7: jd <= 4'he;
        endcase
  end

    // Turn On given FND
    always@(posedge clk) begin
     case(jd)
       4'he: begin
        case(hexValue)
            4'h0: jx <= 8'hfc;
            4'h1: jx <= 8'h60;
            4'h2: jx <= 8'hda;
            4'h3: jx <= 8'hf2;
            4'h4: jx <= 8'h66;
            4'h5: jx <= 8'hb6;
            4'h6: jx <= 8'hbe;
            4'h7: jx <= 8'he0;
            4'h8: jx <= 8'hfe;
            4'h9: jx <= 8'he6;
            4'ha: jx <= 8'hee;
            4'hb: jx <= 8'h3e;
            4'hc: jx <= 8'h9c;
            4'hd: jx <= 8'h7a;
            4'he: jx <= 8'h9e;
            4'hf: jx <= 8'h8e;
        endcase
        end
    4'hd: begin
           case(hexValue2)
            4'h0: jx <= 8'hfc;
            4'h1: jx <= 8'h60;
            4'h2: jx <= 8'hda;
            4'h3: jx <= 8'hf2;
            4'h4: jx <= 8'h66;
            4'h5: jx <= 8'hb6;
            4'h6: jx <= 8'hbe;
            4'h7: jx <= 8'he0;
            4'h8: jx <= 8'hfe;
            4'h9: jx <= 8'he6;
            4'ha: jx <= 8'hee;
            4'hb: jx <= 8'h3e;
            4'hc: jx <= 8'h9c;
            4'hd: jx <= 8'h7a;
            4'he: jx <= 8'h9e;
            4'hf: jx <= 8'h8e;
        endcase
        end
    4'hb: begin
           case(hexValue3)
            4'h0: jx <= 8'hfc;
            4'h1: jx <= 8'h60;
            4'h2: jx <= 8'hda;
            4'h3: jx <= 8'hf2;
            4'h4: jx <= 8'h66;
            4'h5: jx <= 8'hb6;
            4'h6: jx <= 8'hbe;
            4'h7: jx <= 8'he0;
            4'h8: jx <= 8'hfe;
            4'h9: jx <= 8'he6;
            4'ha: jx <= 8'hee;
            4'hb: jx <= 8'h3e;
            4'hc: jx <= 8'h9c;
            4'hd: jx <= 8'h7a;
            4'he: jx <= 8'h9e;
            4'hf: jx <= 8'h8e;
        endcase
        end
    
    4'h7: begin
           case(hexValue4)
            4'h0: jx <= 8'hfc;
            4'h1: jx <= 8'h60;
            4'h2: jx <= 8'hda;
            4'h3: jx <= 8'hf2;
            4'h4: jx <= 8'h66;
            4'h5: jx <= 8'hb6;
            4'h6: jx <= 8'hbe;
            4'h7: jx <= 8'he0;
            4'h8: jx <= 8'hfe;
            4'h9: jx <= 8'he6;
            4'ha: jx <= 8'hee;
            4'hb: jx <= 8'h3e;
            4'hc: jx <= 8'h9c;
            4'hd: jx <= 8'h7a;
            4'he: jx <= 8'h9e;
            4'hf: jx <= 8'h8e;
        endcase
        end
    endcase
end

endmodule
