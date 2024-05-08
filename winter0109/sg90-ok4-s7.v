module servo_controller (
  input clk,
  input rst,
  input [2:0] position,
  output servo
  );
	
  reg pwm_q, pwm_d;
  reg [17:0] ctr_q, ctr_d;
  assign servo = pwm_q;
  reg [14:0] pos ;

  //position (0-255) maps to 6,000-30,000 (which corresponds to 0.5ms-2.5ms @ 12MHz)
  //The servo output is set by comparing the position input with the value of the counter (ctr_q)
 
  always @(*) begin
 
   case (position)
    3'd0: pos =15'd6000   ;  
    3'd1: pos =15'd10000  ;  
    3'd2: pos =15'd14000  ; 
    3'd3: pos =15'd18000  ; //  -- 3 division
    3'd4: pos =15'd21000  ; 
    3'd5: pos =15'd24000  ; 
    3'd6: pos =15'd27000  ; 
    3'd7: pos =15'd30000  ; 
    default : pos = 15'd6000;
    endcase  
 
    ctr_d <= ctr_q + 1'b1;
    if (pos > ctr_q) begin  
      pwm_d = 1'b1;
    end else begin
      pwm_d = 1'b0;
    end
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