// Original source by Daniel Moran 2019
// Translated to verilog by Alon Levy 2021

//----------------------------------------------------------------------------------
//-- Engineer: 	HYung Seok Han
//-- Project: 	Capacitive 4x4 keypad 
//-- Description: reading raw values for keypad by 2 wire communication (not I2C)
//-- ttp229-bsf chip set pad (not ttp229(I2C support)
//----------------------------------------------------------------------------------

module keypad_16(
	input clk,  //12Mhz main clock
	input reset_n,
	input I2C_SDAT,
    output  [7:0]SEG,  // given fnd
    output  [3:0]DIGIT,
	output I2C_SCLK
//	output nokey
 //   output [7:0] key  // key[0] : botton 1 ~ key[7]: button 8
   );

//bin2bcd bin1 (.bin(bin[11:0]), .bcd(bcd));		
//fnd4digit fnd2(.jx(SEG),.jd(DIGIT), .hexValue(bcd[3:0]), .hexValue2(bcd[7:4]), .hexValue3(bcd[11:8]),.hexValue4(bcd[15:12]),.clk(clk));
clk_div #(.target_hz(1000_000)) clk1 (.in_clk(clk), .out_clk(CLOCK_1M));  // 1 us clock 
//clk_div #(.target_hz(4000)) clk2 (.in_clk(clk), .out_clk(CLOCK_2k)); 
wire nokey;
wire [3:0] en_o;
wire [15:0] key ;
//wire nokey;

Encoder_16 enc1(.d(key),.a(en_o),.nokey(nokey));	 
assign nokey = nokey;
fnd1digit_16 fnd1(.SEG(SEG),.DIGIT(DIGIT),.hexValue(en_o),.clk(clk),.nokey(nokey));
//wire [15:0] bcd;
//wire [15:0] bin;

parameter DV = 93; //typical value (ref: spec.)
parameter TW = 10; //min. value
parameter fscl = 250; // assume  2KHz clock 
parameter Tres = 32000; // total time: 16 msec (usec 16000) for 8 button 32 msec for 16 button
parameter res = 22147;  //Tres-(fscl*15+DV+TW+tout) : must change for 16 buttons
parameter res2 = 21897; //Tres-(fscl*16+DV+TW+tout)  must change for 16 buttons
parameter tout = 2000; // tout 
parameter tout2 = 1750; //tout-fscl
//parameter res = 1189;
wire resetn;

reg SCLK;
reg [15:0] data = 16'h0000;
reg [5:0] state=6'd0;
integer dcount = 0;

assign key =~data;
assign I2C_SCLK = SCLK;
	
assign resetn = reset_n;

    always @(posedge CLOCK_1M or posedge resetn) begin //
        if (resetn==1) begin
			SCLK<=1;
			state <= 6'd0;
			dcount <= 0;
			data <= 16'h1111;
        end
        else begin
                case (state)		
                //START
                6'd0	: 	begin
                    SCLK<=1;
                     state <= 6'd1;
                end
                6'd1	: 
               	begin
                if (dcount < DV)  dcount <= dcount+1;
                 else begin
                 state <= 6'd2;
                 dcount <= 0;
                 end
                end
 		
                6'd2	: 	begin
                if (dcount < TW)  dcount <= dcount+1;
                 else begin
                 state <= 6'd3;
                 dcount <= 0;
                 end
                 
						end
                6'd3	: 	begin
					        SCLK<=1'b0;
                if (dcount < fscl)  dcount <= dcount+1;
                 else begin
                 state <= 6'd4;
                 dcount <= 0;
                 end
                 
					end		
 		
                //start reading button 1
                    6'd4	: 	begin
					        SCLK<=1'b1;
					        data[0] <=I2C_SDAT;	
                if (dcount < fscl)  dcount <= dcount+1;
                 else begin
                 state <= 6'd5;
                 dcount <= 0;
                 end				        
					end
  
                    6'd5	: 	begin
					        SCLK<=1'b0;
		        
                if (dcount < fscl)  dcount <= dcount+1;
                 else begin
                 state <= 6'd6;
                 dcount <= 0;
                 end
					end	
              //start reading button 2									
                    6'd6	: 	begin
					        SCLK<=1'b1;
				            data[1] <=I2C_SDAT;
                if (dcount < fscl)  dcount <= dcount+1;
                 else begin
                 state <= 6'd7;
                 dcount <= 0;
                 end
				    end				
                    6'd7	: 	begin
					        SCLK<=1'b0;
                if (dcount < fscl)  dcount <= dcount+1;
                 else begin
                 state <= 6'd8;
                 dcount <= 0;
                 end
					end		
              //start reading button 3												    	
                    6'd8	: 	begin
					        SCLK<=1'b1;
					        data[2] <=I2C_SDAT;
                if (dcount < fscl)  dcount <= dcount+1;
                 else begin
                 state <= 6'd9;
                 dcount <= 0;
                 end
				    end	
                    6'd9	: 	begin
					        SCLK<=1'b0;
                if (dcount < fscl)  dcount <= dcount+1;
                 else begin
                 state <= 6'd10;
                 dcount <= 0;
                 end
					end						
              //start reading button 4								    						
                    6'd10	: 	begin
					        SCLK<=1'b1;
					        data[3] <=I2C_SDAT;
                if (dcount < fscl)  dcount <= dcount+1;
                 else begin
                 state <= 6'd11;
                 dcount <= 0;
                 end
				    end                 
                    6'd11	: 	begin
					        SCLK<=1'b0;
                if (dcount < fscl)  dcount <= dcount+1;
                 else begin
                 state <= 6'd12;
                 dcount <= 0;
                 end
					end							
              //start reading button 5							       
                    6'd12	: 	begin
					        SCLK<=1'b1;
					        data[4] <=I2C_SDAT;
                if (dcount < fscl)  dcount <= dcount+1;
                 else begin
                 state <= 6'd13;
                 dcount <= 0;
                 end
				    end	
                    6'd13	: 	begin
					        SCLK<=1'b0;
                if (dcount < fscl)  dcount <= dcount+1;
                 else begin
                 state <= 6'd14;
                 dcount <= 0;
                 end
					end							
              //start reading button 6							    				
                    6'd14	: 	begin
					        SCLK<=1'b1;
					        data[5] <=I2C_SDAT;
                if (dcount < fscl)  dcount <= dcount+1;
                 else begin
                 state <= 6'd15;
                 dcount <= 0;
                 end
				    end					
	                    6'd15	: 	begin
					        SCLK<=1'b0;
                if (dcount < fscl)  dcount <= dcount+1;
                 else begin
                 state <= 6'd16;
                 dcount <= 0;
                 end
					end							
              //start reading button 7						    
                    6'd16	: 	begin
					        SCLK<=1'b1;
						        data[6] <=I2C_SDAT;
                if (dcount < fscl)  dcount <= dcount+1;
                 else begin
                 state <= 6'd17;
                 dcount <= 0;
                 end
				    end					
                    6'd17	: 	begin
					        SCLK<=1'b0;
                if (dcount < fscl)  dcount <= dcount+1;
                 else begin
                 state <= 6'd18;
                 dcount <= 0;
                 end
					end							
              //start reading button 8							    
                    6'd18	: 	begin
					        SCLK<=1'b1;
					        data[7] <=I2C_SDAT;
                if (dcount < fscl)  dcount <= dcount+1;
                 else begin
                 state <= 6'd19;
                 dcount <= 0;
                 end
				    end	

                6'd19	: 	begin
					        SCLK<=1'b0;
                if (dcount < fscl)  dcount <= dcount+1;
                 else begin
                 state <= 6'd20;
                 dcount <= 0;
                 end
                 
					end		
 		
                //start reading button 9
                    6'd20	: 	begin
					        SCLK<=1'b1;
					        data[8] <=I2C_SDAT;	
                if (dcount < fscl)  dcount <= dcount+1;
                 else begin
                 state <= 6'd21;
                 dcount <= 0;
                 end				        
					end
  
                    6'd21	: 	begin
					        SCLK<=1'b0;
		        
                if (dcount < fscl)  dcount <= dcount+1;
                 else begin
                 state <= 6'd22;
                 dcount <= 0;
                 end
					end	
              //start reading button 10									
                    6'd22	: 	begin
					        SCLK<=1'b1;
				            data[9] <=I2C_SDAT;
                if (dcount < fscl)  dcount <= dcount+1;
                 else begin
                 state <= 6'd23;
                 dcount <= 0;
                 end
				    end				
                    6'd23	: 	begin
					        SCLK<=1'b0;
                if (dcount < fscl)  dcount <= dcount+1;
                 else begin
                 state <= 6'd24;
                 dcount <= 0;
                 end
					end		
              //start reading button 11												    	
                    6'd24	: 	begin
					        SCLK<=1'b1;
					        data[10] <=I2C_SDAT;
                if (dcount < fscl)  dcount <= dcount+1;
                 else begin
                 state <= 6'd25;
                 dcount <= 0;
                 end
				    end	
                    6'd25	: 	begin
					        SCLK<=1'b0;
                if (dcount < fscl)  dcount <= dcount+1;
                 else begin
                 state <= 6'd26;
                 dcount <= 0;
                 end
					end						
              //start reading button 12								    						
                    6'd26	: 	begin
					        SCLK<=1'b1;
					        data[11] <=I2C_SDAT;
                if (dcount < fscl)  dcount <= dcount+1;
                 else begin
                 state <= 6'd27;
                 dcount <= 0;
                 end
				    end                 
                    6'd27	: 	begin
					        SCLK<=1'b0;
                if (dcount < fscl)  dcount <= dcount+1;
                 else begin
                 state <= 6'd28;
                 dcount <= 0;
                 end
					end							
              //start reading button 13							       
                    6'd28	: 	begin
					        SCLK<=1'b1;
					        data[12] <=I2C_SDAT;
                if (dcount < fscl)  dcount <= dcount+1;
                 else begin
                 state <= 6'd29;
                 dcount <= 0;
                 end
				    end	
                    6'd29	: 	begin
					        SCLK<=1'b0;
                if (dcount < fscl)  dcount <= dcount+1;
                 else begin
                 state <= 6'd30;
                 dcount <= 0;
                 end
					end							
              //start reading button 14							    				
                    6'd30	: 	begin
					        SCLK<=1'b1;
					        data[13] <=I2C_SDAT;
                if (dcount < fscl)  dcount <= dcount+1;
                 else begin
                 state <= 6'd31;
                 dcount <= 0;
                 end
				    end					
	                    6'd31	: 	begin
					        SCLK<=1'b0;
                if (dcount < fscl)  dcount <= dcount+1;
                 else begin
                 state <= 6'd32;
                 dcount <= 0;
                 end
					end							
              //start reading button 15						    
                    6'd32	: 	begin
					        SCLK<=1'b1;
						        data[14] <=I2C_SDAT;
                if (dcount < fscl)  dcount <= dcount+1;
                 else begin
                 state <= 6'd33;
                 dcount <= 0;
                 end
				    end					
                    6'd33	: 	begin
					        SCLK<=1'b0;
                if (dcount < fscl)  dcount <= dcount+1;
                 else begin
                 state <= 6'd34;
                 dcount <= 0;
                 end
					end							
              //start reading button 16							    
                    6'd34	: 	begin
					        SCLK<=1'b1;
					        data[15] <=I2C_SDAT;
                if (dcount < fscl)  dcount <= dcount+1;
                 else begin
                 state <= 6'd35;
                 dcount <= 0;
                 end
				    end	








					
              //stop reading button 				    
			6'd35	: 	begin
					        SCLK<=1'b1;
                if (dcount < tout2)  dcount <= dcount+1;
                 else begin
                 state <= 6'd36;
                 dcount <= 0;
                 end
					end		
              //restart reading button 					
								6'd36	: 	begin
					        SCLK<=1'b1;
                if (dcount < fscl)  dcount <= dcount+1;
                 else begin
                 state <= 6'd0;
                 dcount <= 0;
                 end
					end					

                    default: begin
                        SCLK<=1'b0;
                    end

                endcase
            end
  end

endmodule

