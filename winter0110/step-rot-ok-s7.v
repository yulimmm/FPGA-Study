module steprot2 (clk, dir,reset, motor_data);
   input  clk, dir, reset ; // 12MHZ
   output [7:0] motor_data;
   reg    [1:0] m_cnt = 2'b00;

   reg    [7:0] motor_data;
   wire    clk2;
   reg     stop = 1'b0;
   integer step_cnt = 0;
// 1상 여자 방식의 모터 구동신호를 생성, 모터의 회전속도를 제어하기 위해 클록신호를 400Hz로 분주
clk_div # (.target_hz(400)) clk1(.in_clk(clk), .out_clk(clk2));
assign clk2 = clk2;
// dir에  따른 모터 회전 방향을 반대로 제어 
always @(posedge clk2) begin
       if (reset) begin
           stop <= 1'b0;
           step_cnt <= 0;
       end
	   if (step_cnt >=2048) begin
		 step_cnt <= 0;
		 stop <= 1'b1;
		 end
	   if (stop == 1'b1)
           motor_data <= 8'b00000000;	   
	   else begin
	     step_cnt <= step_cnt + 1'b1;				
         if (dir) begin
           case (m_cnt)
                   0 : motor_data <= 8'b10000001;  // A, B, /A, /B
                   1 : motor_data <= 8'b01000010;
                   2 : motor_data <= 8'b00100100;
                   3 : motor_data <= 8'b00011000;
             default : motor_data <= 8'b10000001;
           endcase
           end
         else begin
           case (m_cnt)
                   0 : motor_data <= 8'b00011000;
                   1 : motor_data <= 8'b00100100;
                   2 : motor_data <= 8'b01000010;
                   3 : motor_data <= 8'b10000001;
             default : motor_data <= 8'b00011000;
           endcase
           end
       end
       m_cnt <= m_cnt + 1;
end
endmodule