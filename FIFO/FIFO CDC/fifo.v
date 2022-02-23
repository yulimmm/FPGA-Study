`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/23 14:59:24
// Design Name: 
// Module Name: FIFO
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


module FIFO #(parameter MSB = 8, parameter addrsize = 8)(
    rdata,
    full,
    empty,
    wclken,
    raddr,
    waddr,
    rptr,
    wptr,
    wq2_rptr,
    rq2_wptr,
    wdata,
    wclk, 
    wrst_n, 
    winc,
    rclk, 
    rrst_n, 
    rinc
    );
    
    output [MSB-1:0]rdata;
    output full;
    output empty;
    output wclken;
    output [addrsize-1:0]raddr;
    output [addrsize-1:0]waddr;
    output [addrsize:0]rptr;
    output [addrsize:0]wptr;    
    output [addrsize:0]wq2_rptr;
    output [addrsize:0]rq2_wptr;
    input [MSB-1:0]wdata;
    input wclk;
    input wrst_n;
    input winc;
    input rclk;
    input rrst_n;
    input rinc;
    
    assign wclken = ~full & winc;
    
    // Dual Port Ram
    dual_port_ram #(MSB, addrsize) ram(.rd(rdata), .clk(wclk), .wd(wdata), .ra(raddr), .wa(waddr), .we(wclken));
    
    // wptr & full logic
    address_pointer #(addrsize) Write_Pointer(.addr(waddr), .ptr(wptr), .clk(wclk), .rst_n(wrst_n), .state(full), .c(winc));
    flag_full #(addrsize) Full_Flag(.full(full), .clk(wclk), .rst_n(wrst_n), .ptr(wptr), .q2_ptr(wq2_rptr));
    
    // rptr & empty logic
    address_pointer #(addrsize) Read_Pointer(.addr(raddr), .ptr(rptr), .clk(rclk), .rst_n(rrst_n), .state(empty), .c(rinc));
    flag_empty #(addrsize) Empty_Flag(.empty(empty), .clk(rclk), .rst_n(rrst_n), .ptr(rptr), .q2_ptr(rq2_wptr));
    
    // wq2_rptr sync
    sync #(addrsize) sync_wq2(.q2_ptr(wq2_rptr), .clk(wclk), .rst_n(wrst_n), .ptr(rptr));
    
    // rq2_wptr sync
    sync #(addrsize) sync_rq2(.q2_ptr(rq2_wptr), .clk(rclk), .rst_n(rrst_n), .ptr(wptr));
endmodule
