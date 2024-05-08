
module mcp3202FND (
    input CLK12M,
    input vauxp5, vauxn5,
     input vauxp12, vauxn12,
     input sel,    // select channel 1: vaux5 or 0: vaux12
//	  input rstb, 
//	   input sw,
// 		input dout,
 //    output reg cs,
 //    output clk,		
 //    output reg din,	
     output eoc_out,               
     output  [3:0] DIGIT,  // to call external module, must be wire (not reg)
   	output  [7:0] SEG  // to call external module, must be wire (not reg)
);

//parameter MAX_CLOCK_BIT = 22;
parameter MAX_CLOCK_BIT = 15;  // sampling interval lower=> faster
reg [MAX_CLOCK_BIT:0] slowclk;

always@(posedge CLK12M) begin

    slowclk <= slowclk+1;

end

wire convst_in2;

assign convst_in2 = slowclk[MAX_CLOCK_BIT];
// wire eoc_out;
 reg [11:0] adc_value;
 wire [15:0] do_out;
 wire [15:0] bcd;
 wire [4:0] channel_out;
 wire adClk;
 reg [4:0] channel;
assign channel_out = channel;
 xadc_wiz_0 adc2
          (
          .convst_in(convst_in2 ),           // Convert Start Input
          .daddr_in(channel_out),            // Address bus for the dynamic reconfiguration port
          .dclk_in(CLK12M),               // Clock input for the dynamic reconfiguration port
         .den_in(eoc_out),              // Enable Signal for the dynamic reconfiguration port
//          di_in,               // Input data bus for the dynamic reconfiguration port
//          dwe_in,              // Write Enable for the dynamic reconfiguration port
          .reset_in(1'b0),              // Reset signal for the System Monitor control logic
          .vauxp5(vauxp5),              // Auxiliary channel 5
          .vauxn5(vauxn5),
          .vauxp12(vauxp12),             // Auxiliary channel 12
          .vauxn12(vauxn12),
//          busy_out,            // ADC Busy signal
//          .channel_out(channel_out),         // Channel Selection Outputs
//           .channel_out(),
          .do_out(do_out),              // Output data bus for dynamic reconfiguration port
//          drdy_out,            // Data ready signal for the dynamic reconfiguration port
          .eoc_out(eoc_out)             // End of Conversion Signal
//          eos_out,             // End of Sequence Signal
//          vccaux_alarm_out,    // VCCAUX-sensor alarm output
//          vccint_alarm_out,    //  VCCINT-sensor alarm output
 //         user_temp_alarm_out, // Temperature-sensor alarm output
//          alarm_out,           // OR'ed output of all the Alarms    
//          vp_in,               // Dedicated Analog Input Pair
 //         vn_in)
 );

bin2bcd bin1 (.bin(adc_value), .bcd(bcd));		
 
//wire adClk,
//reg [12:0] clkDiv		;
//wire clk		;
//reg adClk_bufg	;
//reg [4:0] adCnt		= 5'b00000;
//reg [11:0] adData	;
//reg [14:0]  fndhold		;


//reg [3:0] one,ten, hundred, thousand; 
//reg [6:0] out_one,out_ten,out_hundred, out_thousand;
//reg [11:0] bsample =12'b000000000000;
///reg [15:0] bcdout = 16'h0000;  
//wire clk_25k; 

// 12비트의 2진수를 0-4095의 4자리의 십진수를 변환하는 함수 
// 입력 bin 12비트 이진수
// 출력 bcd 16비트 이진수 (4자리의 10진수에 대한 이진수값)
// 천의 자리 bcd(15 downto 12) ..... 일의자라 bcd(3 downto 0)
// 구하는 방법은 일반적인 알고리즘 사용 

  

 // mcp3202FND  아키텍쳐 시작

	
	
	

clk_div # (.target_hz(2)) clk1(.in_clk(CLK12M), .out_clk(adClk));

//clk_div # (.target_hz(24000)) clk2(.in_clk(CLK12M), .out_clk(clk_25k));

always@(posedge CLK12M) begin
if (sel == 1'b01)       
  channel <= 5'b10101;   //vaux5 address h15, vaux12 address h1c
  else 
  channel <= 5'b11100;
  end



always@(negedge  adClk) begin
// adc_value = {2'b00, do_out[15:6]};
  adc_value = do_out[15:4];
 end



fnd4digit fnd2(.jx(SEG),.jd(DIGIT), .hexValue(bcd[3:0]), .hexValue2(bcd[7:4]), .hexValue3(bcd[11:8]),.hexValue4(bcd[15:12]),.clk(CLK12M));

//fnd8digit fnd2(.jx(SEG),.jd(DIGIT), .hexValue(one), .hexValue2(ten), .clk(clk_25k));


endmodule

