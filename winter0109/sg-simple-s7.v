`timescale 10 ns / 100 ps
//
// palallax motor possible : position[0] direction change key 
//

module servomtr (
    input clk,  //base on 12MHZ clock
    input [1:0] position, //left(10), right(01), neutral(00,11)
    output servo
    );
    /* SG90 9g micro servo, Tower Pro (sg90servo.pdf)
     1.5 ms pulse for middle, 2ms (2.3ms) for right, 1 ms (0.64ms) for left duty cycle
    ----
    |   |------------------------|
    <---------------------------->
             20ms (50HZ)
    */
    
    localparam MS_20 = 20'h3bd08; //20ms from 12MHZ clock (240,000)
    localparam MIDDLE = 20'h04650; // 1.5 ms  middle (1.47ms:17,640)
//    localparam MIDDLE = 20'd17640; // 1.5 ms  middle (1.47ms:17,640)
//    localparam ALLRIGHT = 20'h05dc0 ; // 2ms all the way right
    localparam ALLRIGHT = 20'h07530 ; // 2ms all the way right 90deg (90deg pulse 30,000(2.3ms:27,600) count not 24,000)
    localparam ALLLEFT = 20'h01770; //1 ms all the way left  0(-90deg pulse 6,000(0.64ms:7,680) count not 12,000)
//    localparam ALLRIGHT = 20'd27600 ; // 2ms all the way right 90deg (90deg pulse 30,000(2.3ms:27,600) count not 24,000)
//    localparam ALLLEFT = 20'd7680; //1 ms all the way left  0(-90deg pulse 6,000(0.64ms:7,680) count not 12,000)
  

    reg [19:0] count;
    reg pulse;

    initial count = 0; //for simulation

    assign servo = pulse; //output

    always@(posedge clk) 
            count <= (count == MS_20) ? 0 : count + 1'b1; /* 20 ms period */

    always@(*) 	
        case(position)
            2'b01: pulse = (count <= ALLRIGHT); //right all the way
            2'b00: pulse = (count <= ALLLEFT); //left all the way
            default: pulse = (count <= MIDDLE);  //center 
        endcase

endmodule
