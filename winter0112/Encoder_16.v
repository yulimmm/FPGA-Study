`timescale 1ns / 1ps
module Encoder_16(d, a, nokey);
	input[15:0] 		d ; 
	output[3:0] 	a ;
    output nokey;
     
	reg [3:0] 		a;
    reg nokey; // 1: no key pressed   0: key pressed 
	always @ (d)
	begin
      nokey = 1'b0;
			if (d == 16'h8000) begin
				a = 4'h0;
			end else if (d == 16'h4000) begin
				a = 4'hf; 
			end else if (d == 16'h2000) begin
				a = 4'he; 	
			end else if (d == 16'h1000) begin
				a = 4'hd; 
			end else if (d == 16'h0800) begin
				a = 4'hc; 	
			end else if (d == 16'h0400) begin
				a = 4'hb; 			
			end else if (d == 16'h0200) begin
				a = 4'ha; 				
			end else if (d == 16'h0100) begin
				a = 4'h9; 
			end else if (d == 16'h0080) begin
				a = 4'h8; 
			end else if (d == 16'h0040) begin
				a = 4'h7; 
			end else if (d == 16'h0020) begin
				a = 4'h6; 
			end else if (d == 16'h0010) begin
				a = 4'h5; 
			end else if (d == 16'h0008) begin
				a = 4'h4; 
			end else if (d == 16'h0004) begin
				a = 4'h3; 
			end else if (d == 16'h0002) begin
				a = 4'h2; 
			end else if (d == 16'h0001) begin
				a = 4'h1;
		   end else begin
		   		nokey = 1'b1;  // no key pressed 
				a = 4'h0;

			end				

	end
endmodule