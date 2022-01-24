`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/21 16:30:33
// Design Name: 
// Module Name: TB_xnor
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


module TB_xnor();

    reg j,k,l;
    wire z1,z2,z3;
    
    G_xnor sim_xnor_s(z1,j,k,l);
    G_xnor_data sim_xnor_D(z2,j,k,l);
    G_xnor_be sim_xnor_B(z3,j,k,l);
    
    initial
    begin
        j=0;
        k=0;
        l=0;
    end
    
    initial
    begin
        #100 j=0;k=0;l=1;
        #100 j=0;k=1;l=0;
        #100 j=0;k=1;l=1;
        #100 j=1;k=0;l=0;
        #100 j=1;k=0;l=1;
        #100 j=1;k=1;l=0;
        #100 j=1;k=1;l=1;
    end
endmodule
