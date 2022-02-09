`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/09 20:05:26
// Design Name: 
// Module Name: spRam_Tb
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


module spRam_Tb();
    parameter msb = 8;
    parameter addrsize = 8;
    
    wire [msb-1:0]douta;
    reg clka, wea;
    reg [addrsize-1:0]addra;
    reg [msb-1:0]dina;
    
    spRam #(msb, addrsize) spRam_Tb (douta, clka, wea, addra, dina);
    
    initial
    begin
    clka = 0;
    wea = 0;
    addra = 8'b00000000;
    dina = 8'b00000000;
    forever #10 clka = ~clka;
    end
    
    initial
    fork
    #27 wea = 1;
    #60 addra = 8'b00010101;
    #74 dina = 8'b01010000;
    join
    
endmodule
