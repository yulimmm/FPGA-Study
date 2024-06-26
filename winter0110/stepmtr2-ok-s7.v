module stepmtr2 (clk, dir, motor_data);
   input        clk, dir;  //clk=12MHZ
   output [7:0] motor_data;
   reg    [1:0] m_cnt = 2'b00;
   // reg    [6:0] cnt_d;
   // reg    [4:0] cnt_s;
   reg    [7:0] motor_data;
   wire          clk2;


// 1? ?¬? λ°©μ? λͺ¨ν° κ΅¬λ? ?Έλ₯? ??± 
// λͺ¨ν°? ?? ??λ₯? ? ?΄?κΈ? ??΄ ?΄λ‘μ ?Έλ₯? 1/50,000 λΆμ£Ό(240 Hz)
clk_div # (.target_hz(400)) clk1(.in_clk(clk), .out_clk(clk2));

assign clk2 = clk2;
// dir?  ?°λ₯? λͺ¨ν° ??  λ°©ν₯? λ°λ?λ‘? ? ?΄ 
always @(posedge clk2) begin
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

       m_cnt <= m_cnt + 1;
       end
endmodule