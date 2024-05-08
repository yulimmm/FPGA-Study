module PWM (PWM_out, PWM_out2, clk , sel);

input clk;
input [2:0] sel;

output reg PWM_out;
output reg PWM_out2; // 1 bit PWM output

// wire [7:0] counter_out; // 8-bit counter output

parameter count_max = 240000;
parameter duty_cck  = 20399 ; 
parameter duty_ck  = 15599;     
parameter stop_n = 18249; 
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
case(sel)
3'b000: begin
duty <= stop_n;
duty2 <= stop_n;
end

3'b001: begin
duty <= stop_n;
duty2 <=duty_cck;
end

3'b010: begin
duty <= duty_cck;
duty2 <= duty_ck;
end

3'b011: begin
duty <= duty_ck;
duty2 <= stop_n;
end

3'b100: begin
duty <= duty_cck;
duty2 <= stop_n;
end

3'b101: begin
duty <= duty_ck;
duty2 <= duty_ck;
end

3'b110: begin
duty <= stop_n;
duty2 <= duty_ck;
end

3'b111: begin
duty <= duty_ck;
duty2 <= duty_cck;
end
endcase
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