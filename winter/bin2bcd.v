`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/09 21:29:58
// Design Name: 
// Module Name: bin2bcd
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


module bin2bcd(
    input [11:0]bin,
    output reg [15:0]bcd
    );
    
    // Internal variables
    integer i;   
    
    // Always block - implement the Double Dabble algorithm
    always @(bin) begin
        bcd = 0; // initialize bcd to zero.
        for (i = 0; i < 12; i = i+1) begin // run for 12 iterations
            bcd = {bcd[14:0], bin[11-i]}; // concatenation
            
            // if a hex digit of 'bcd' is more than 4, add 3 to it.  
            if(i < 11 && bcd[3:0] > 4) 
                bcd[3:0] = bcd[3:0] + 3;
            if(i < 11 && bcd[7:4] > 4)
                bcd[7:4] = bcd[7:4] + 3;
            if(i < 11 && bcd[11:8] > 4)
                bcd[11:8] = bcd[11:8] + 3;  
            if(i < 11 && bcd[15:12] > 4)
                bcd[15:12] = bcd[15:12] + 3;  
        end
    end     
                    
    
endmodule
