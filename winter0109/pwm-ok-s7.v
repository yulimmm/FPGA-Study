module PWM (PWM_out, PWM_out2, clk , sel);

input clk, sel; // Port type declared
// input [7:0] PWM_ontime; // 8-bit PWM input

output reg PWM_out;
output reg PWM_out2; // 1 bit PWM output

wire [7:0] counter_out; // 8-bit counter output

parameter count_max = 240000;
parameter duty_cck  = 20399 ; 
parameter duty_ck  = 15599;     
integer counter = 0, duty, duty2;

always @ (posedge clk)
begin
if (counter < count_max)
   counter <= counter + 1'b1;
else 
   counter <= 0;
end

always @ (posedge clk)
begin
if (sel == 1'b0) begin 
     duty <= duty_cck;
     duty2 <= duty_ck;
     end
 else begin
     duty <= duty_ck;
     duty2 <= duty_cck;
     end
end

always @ (posedge clk)
begin
if (counter < duty)
   PWM_out <=  1'b1;
   else
   PWM_out  <=  1'b0;

if (counter < duty2)
   PWM_out2 <=  1'b1;
   else
   PWM_out2  <=  1'b0;

end     
endmodule