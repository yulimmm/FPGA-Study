`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/07 23:01:05
// Design Name: 
// Module Name: Single_Port_Ram
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


 module Single_Port_Ram #(parameter msb = 8, parameter addrsize = 8)(
	douta,
	clka,
	wea,
	addra,
	dina
	);
	
	localparam depth = 1<<addrsize;

	output [msb-1:0]douta;
	input clka;
	input wea;
	input [addrsize-1:0]addra;
	input [msb-1:0]dina;

	reg [msb-1:0] mem[0:depth-1];
	reg [addrsize-1:0]addr_reg;
	
	assign douta = mem[addr_reg];
	
	always@(posedge clka)
	begin
	   if(wea)
	       mem[addra] <= dina;
	       
	       addr_reg <= addra;
	end
	
endmodule
