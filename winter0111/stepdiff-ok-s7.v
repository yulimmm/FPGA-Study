module stepdiff (clk, dir,dip_sw,motor_l,motor_r);
   input   clk,dir;  //clk=12MHZ
   input  [3:0] dip_sw;      
   output [3:0] motor_l;
   output [3:0] motor_r;  
   
   reg    [1:0] m_cntl= 0;
   reg    [1:0] m_cntr= 0;
   reg    [3:0] motor_l;
   reg    [3:0] motor_r;
   reg          motor_l_clk;
   reg          motor_r_clk;
   integer speed_l ;
   integer speed_r ;
   reg [31:0]counter_l;
   reg [31:0]counter_r;    
// make target_hz
always @(posedge clk) begin		
			case ({dip_sw[3], dip_sw[2]})
				2'b00: speed_l <= 60;
				2'b01: speed_l <= 120;
				2'b10: speed_l <= 240;
				2'b11: speed_l <= 400;
			 default : speed_l <= 60;
			endcase
		end
always @(posedge clk) begin					
			case ({dip_sw[1], dip_sw[0]})
				2'b00: speed_r <= 60;
				2'b01: speed_r <= 120;
				2'b10: speed_r <= 240;
				2'b11: speed_r <= 400;
			 default : speed_r <= 60;
			endcase			
		end			
always @(posedge clk) begin			
        counter_l <= counter_l + 1;
        if(counter_l > (12000000/(2*speed_l))-1) begin
            motor_l_clk <= ~motor_l_clk;
            counter_l <= 0;
                end
end
always @(posedge clk) begin			
        counter_r <= counter_r + 1;
        if(counter_r > (12000000/(2*speed_r))-1) begin
            motor_r_clk <= ~motor_r_clk;
            counter_r <= 0;
                end
end             
// dir에  따른 모터 회전 방향을 반대로 제어 
always @(posedge motor_l_clk) begin
      if (~dir) begin
           case (m_cntl)
                   0 : motor_l <= 4'b1000;  // A, B, /A, /B
                   1 : motor_l <= 4'b0100;
                   2 : motor_l <= 4'b0010;
                   3 : motor_l <= 4'b0001;
             default : motor_l <= 4'b1000;
           endcase
           end
      else begin 
           case (m_cntl)
                   0 : motor_l <= 4'b0001;  // A, B, /A, /B
                   1 : motor_l <= 4'b0010;
                   2 : motor_l <= 4'b0100;
                   3 : motor_l <= 4'b1000;
             default : motor_l <= 4'b0001;
           endcase
           end
    m_cntl <= m_cntl + 1;
end
always @(posedge motor_r_clk) begin
      if (~dir) begin
           case (m_cntr)
                   0 : motor_r <= 4'b0001;  // A, B, /A, /B
                   1 : motor_r <= 4'b0010;
                   2 : motor_r <= 4'b0100;
                   3 : motor_r <= 4'b1000;
             default : motor_r <= 4'b0001;           
           endcase
           end
      else begin 
           case (m_cntr)
                   0 : motor_r <= 4'b1000;  // A, B, /A, /B
                   1 : motor_r <= 4'b0100;
                   2 : motor_r <= 4'b0010;
                   3 : motor_r <= 4'b0001;
             default : motor_r <= 4'b1000;
           endcase 
           end
    m_cntr <= m_cntr + 1;
end           

endmodule