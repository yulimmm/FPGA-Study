`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/19 23:44:45
// Design Name: 
// Module Name: g_nand2
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


module g_nand2();

    reg j,k,l;
    wire z1,z2,z3;//출력보는거
    
    g_nand sim_nand_s(z1,j,k,l);//함수가져옴 모듈명
    g_nand_data sim_nand_D(z2,j,k,l);
    g_nand_be sim_nand_B(.y(z3), .a(j), .b(k), .c(l)); //1:1대응
    
    initial //setting 초기화 작업
    begin
        j=0;
        k=0;
        l=0;
    end
    
    initial
    begin
        #100 j=0; k=0; l=1; //엔터치면 개판남.
        #100 j=0; k=1; l=0;
        #100 j=0; k=1; l=1;
        #100 j=1; k=0; l=0;
        #100 j=1; k=0; l=1;
        #100 j=1; k=1; l=0;
        #100 j=1; k=1; l=1;
        
    end
endmodule
