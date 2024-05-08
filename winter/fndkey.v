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
// 4 digit display (thousand : 4, hundred : 3 ten: dip(hexValue2) one:dip(hexValue) 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fndkey(
    output reg [7:0]SEG,  // given fnd
    output reg [3:0]DIGIT,
    input btn,
    input reset,
    input clk
    );
    reg  DIGIT = 4'he ;
    reg [3:0]  one = 4'h0, ten = 4'h0;
    wire clkdigit;
    clk_div #(.target_hz(240)) clk1 (.in_clk(clk), .out_clk(clkdigit));
always@(posedge clkdigit) begin
    case(DIGIT)
        4'he: DIGIT <= 4'hd;
        4'hd: DIGIT <= 4'hb;
        4'hb: DIGIT <= 4'h7;
        4'h7: DIGIT <= 4'he;
    endcase
end


    reg pushflag = 0;
    
////////////////////////////////////////////////////
// ---- IMPORTANT ---------- 
// blocking and non blocking
// According to <= or  =, different resul given   
// Must check two cases  
/////////////////////////////////////////////////////
always @(posedge clk) begin
if (reset == 1) begin
       one <= 4'h0;
       ten <= 4'h0;
    end 
else begin
    if (btn == 1 && pushflag == 0) begin
        pushflag <= 1;
        one <= one + 4'h1;
        if (one >= 4'h9) begin  //blocking case : one > 4'h9
            one <= 4'h0;
            ten <= ten + 4'h1;
        end
        if (ten >= 4'h1 && one >= 4'h9 ) begin //19가 넘어가면 0으로 초기화 
            ten <= 4'h0;     
        end
    end
    else if (btn == 0) begin
           pushflag <= 0;
          end
    end
    // Turn On given FND
end   
always@(posedge clk) begin
    case(DIGIT)
        4'he: begin 
            case(one)
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
            case(ten)
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
        4'hb: SEG <= 8'h00;
        4'h7: SEG <= 8'h00;  
 
    endcase
end
endmodule
