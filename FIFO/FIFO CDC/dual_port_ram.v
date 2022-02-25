`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/23 14:55:26
// Design Name: 
// Module Name: dual_port_ram
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


module dual_port_ram#(parameter MSB = 8, parameter addrsize = 8)( //파라미터 최상위 사이즈 8로 지정, addrsize도 8로 지정
    rd,
    clk,
    wd,
    ra,
    wa,
    we
    );
    
    localparam depth = 1<<addrsize; //depth = 램 배열, 1을 addrsize 만큼 왼쪽으로 이동
    
    output [MSB-1:0]rd;  // 아웃풋 8비트 rdata
    input clk;  //클락
    input [MSB-1:0]wd;  //인풋 8비트 wdata
    input [addrsize-1:0]ra;  //8비트 raddr
    input [addrsize-1:0]wa;  //8비트 waddr
    input we; //wclken
    
    reg [MSB-1:0] ram [0:depth-1];  //MSB-1:0 벡터와 depth-1 크기를 가진 RAM 을 가지는 reg 선언 (=ram [MSB-1:0] [depth-1:0])
    
    assign rd = ram[ra]; //rdata = raddr번째의 램, ram의 raddr번째의 데이터를 뺀다. (rd 는 ram의 ra 위치에 값을 출력받는다)
    
    always@(posedge clk)  // rising edge(0->1) 
    begin
        if(we)  //만약 wclken이 rising edge 라면
            ram[wa] <= wd;  //램의 waddr 위치에 wdata가 들어간다.
    end
endmodule
