module top_servo (PWM_1, PWM_2, clk , cmd, rst, servo);

input clk;
input [2:0] cmd;
input rst; //SG-90 sensor module에 있는 rst 추가 
output  PWM_1;
output  PWM_2; // 1 bit PWM output
output servo; //SG-90 output 

PWM pwmpara (.clk(clk), .sel(cmd), .PWM_out(PWM_1), .PWM_out2(PWM_2));
servo_controller (.clk(clk), .rst(rst), .position(cmd), .servo(servo)); // SG-90 sensor module 불러옴 

endmodule