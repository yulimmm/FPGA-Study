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
    output reg [7:0]SEG,  // given fnd
    output reg [3:0]DIGIT,
    //input [3:0]hexValue, 인풋 사용 안 하므로 주석
    //input [3:0]hexValue2, 인풋 사용 안 하므로 주석
    input clk
    );
    
reg DIGIT = 4'he;
wire clkdigit;
wire [3:0] hexValue; //4번째 세그먼트 선언 
wire [3:0] hexValue2; //3번째 세그먼트 선언
wire [3:0] hexValue3; //2번째 세그먼트 선언
wire [3:0] hexValue4; //1번째 세그먼트 선언
clk_div #(.target_hz(180)) clk1 (.in_clk(clk), .out_clk(clkdigit));
assign hexValue = 4'h9; //4번째 자리에 9 출력
assign hexValue2 = 4'h0; //3번째 자리에 0 출력
assign hexValue3= 4'h3; //2번째 자리에 3 출력
assign hexValue4 = 4'h2; //1번째 자리에 2 출력
always@(posedge clkdigit) begin  // right to left
    case(DIGIT)
        4'he: DIGIT <= 4'hd;  // e=1110  
        4'hd: DIGIT <= 4'hb;  //d=1101
        4'hb: DIGIT <= 4'h7;    //b=1011
        4'h7: DIGIT <= 4'he;    //7=0111
    endcase
end

    // Turn On given FND
always@(posedge clk) begin
    case(DIGIT)
        4'he: begin
               case(hexValue)
                  4'h0: SEG <= 8'hfc;
                  4'h1: SEG <= 8'h60;
                  4'h2: SEG <= 8'hda;
                  4'h3: SEG <= 8'hf2;
                  4'h4: SEG <= 8'h66;
                  4'h5: SEG <= 8'hb6;
                  4'h6: SEG <= 8'hbe;
                  4'h7: SEG <= 8'he0;
                  4'h8: SEG <= 8'hfe;
                  4'h9: SEG <= 8'he6;
                  4'ha: SEG <= 8'hee;
                  4'hb: SEG <= 8'h3e;
                  4'hc: SEG <= 8'h9c;
                  4'hd: SEG <= 8'h7a;
                  4'he: SEG <= 8'h9e;
                  4'hf: SEG <= 8'h8e;
               endcase
               end
        4'hd: begin
              case(hexValue2)
                  4'h0: SEG <= 8'hfc;
                  4'h1: SEG <= 8'h60;
                  4'h2: SEG <= 8'hda;
                  4'h3: SEG <= 8'hf2;
                  4'h4: SEG <= 8'h66;
                  4'h5: SEG <= 8'hb6;
                  4'h6: SEG <= 8'hbe;
                  4'h7: SEG <= 8'he0;
                  4'h8: SEG <= 8'hfe;
                  4'h9: SEG <= 8'he6;
                  4'ha: SEG <= 8'hee;
                  4'hb: SEG <= 8'h3e;
                  4'hc: SEG <= 8'h9c;
                  4'hd: SEG <= 8'h7a;
                  4'he: SEG <= 8'h9e;
                  4'hf: SEG <= 8'h8e;
               endcase
               end
        4'hb: begin
              case(hexValue3)
                  4'h0: SEG <= 8'hfc;
                  4'h1: SEG <= 8'h60;
                  4'h2: SEG <= 8'hda;
                  4'h3: SEG <= 8'hf2;
                  4'h4: SEG <= 8'h66;
                  4'h5: SEG <= 8'hb6;
                  4'h6: SEG <= 8'hbe;
                  4'h7: SEG <= 8'he0;
                  4'h8: SEG <= 8'hfe;
                  4'h9: SEG <= 8'he6;
                  4'ha: SEG <= 8'hee;
                  4'hb: SEG <= 8'h3e;
                  4'hc: SEG <= 8'h9c;
                  4'hd: SEG <= 8'h7a;
                  4'he: SEG <= 8'h9e;
                  4'hf: SEG <= 8'h8e;
               endcase
               end
    
        4'h7: begin
              case(hexValue4)
                  4'h0: SEG <= 8'hfc;
                  4'h1: SEG <= 8'h60;
                  4'h2: SEG <= 8'hda;
                  4'h3: SEG <= 8'hf2;
                  4'h4: SEG <= 8'h66;
                  4'h5: SEG <= 8'hb6;
                  4'h6: SEG <= 8'hbe;
                  4'h7: SEG <= 8'he0;
                  4'h8: SEG <= 8'hfe;
                  4'h9: SEG <= 8'he6;
                  4'ha: SEG <= 8'hee;
                  4'hb: SEG <= 8'h3e;
                  4'hc: SEG <= 8'h9c;
                  4'hd: SEG <= 8'h7a;
                  4'he: SEG <= 8'h9e;
                  4'hf: SEG <= 8'h8e;
               endcase
               end
    endcase
end

endmodule
