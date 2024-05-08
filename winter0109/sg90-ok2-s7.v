//
// palallax motor possible : dip[7] direction change key 
//
module servo_controller (
  input clk,
  input rst,
  input [7:0] position,
  output servo
  );
	
  reg pwm_q, pwm_d;
  reg [17:0] ctr_q, ctr_d;
  assign servo = pwm_q;
  //position (0-255) maps to 6,000-30,000 (which corresponds to 0.5ms-2.5ms @ 12MHz)
  //this is approximately (position+165)<<8
  //The servo output is set by comparing the position input with the value of the counter (ctr_q)
  always @(*) begin
    ctr_d = ctr_q + 1'b1;

    if ((position * 94 + 15'd6000) > ctr_q) begin  //position 0 : -90deg (6000) position hff : 90deg (30,000) position h7f: 0deg (18,000) 
      pwm_d = 1'b1;
    end else begin
      pwm_d = 1'b0;
    end
//    if (position == 8'h00) begin
//       if ( 9'd250 > ctr_q[17:7]) 
//         pwm_d = 1'b1;
//       else 
//         pwm_d = 1'b0;
//    end
  end
	
  always @(posedge clk) begin
    if (rst) begin
      ctr_q <= 1'b0;
    end else begin
      ctr_q <= ctr_d;
    end
    pwm_q <= pwm_d;
  end
endmodule