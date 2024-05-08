`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/09 12:15:12
// Design Name: 
// Module Name: fnd
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 4 digit display (thousand : 4, hundred : 3 ten: dip(hexValue2) one:dip(hexValue) 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module irreceiver(
    output reg [7:0]SEG,  // given fnd
    output reg [3:0]DIGIT,
 //     input [0:0]btn,
//    output reg [3:0]digit,
    //input [3:0]hexValue,
   // input [3:0]hexValue2,  
    input clk,
    input iIRDA,     
    input rstb,   
    output reg  oDataReady,
    output reg [7:0] oData   
    );
	
//	  type TState is (IDLE, Guidance, DataRead);
parameter IDLE = 2'b00;
parameter             Guidance = 2'b01;
parameter          DataRead = 2'b11;


 parameter  IDLE_HIGH_DUR = 62909;  //Threshold for DataRead -> IDLE  --262143
                                                   // 5.24ms / 20ns = 262143
 parameter GUIDE_LOW_DUR    = 55156;  // Threshold for IDLE -> Guidance  --230000
                                                   // 4.6ms / 20ns = 230000
  parameter GUIDE_HIGH_DUR  = 50396;  // Threshold for Guidance -> DataRead
                                                   // 4.2ms / 20ns = 210000
  parameter DATA_HIGH_DUR    = 9959;   // Threshold for logic '1'
                                                   // 0.83ms / 20ns = 41500
  parameter BIT_AVAILABLE_DUR  = 4800;   // Bit available time
                                                   // 0.4ms / 20ns = 20000
                                                   
  reg [1:0] CurrentState = IDLE, NextState = IDLE;
  integer idle_count = 0,      state_count = 0,      data_count      = 0;      // Counters
  reg idle_count_flag = 1'b0, state_count_flag = 1'b0, data_count_flag = 1'b0;  // Flags for counters
  integer bit_count                                          = 0;     // Amount of received bits
  reg data_ready                                         = 1'b0;  // Data ready flag
  reg [31:0] data, data_reg ;                         // Data builder + data register
  
  reg clk_500;
  reg [7:0] seg1, seg0 ; 
  reg [3:0] A, B ; 
//  signal reset :  std_ulogic := '0';
  reg reset2 = 1'b1;  
 reg DIGIT = 4'he;  
//    reg  DIGIT = 4'he ;
 //   reg[7:0] hundred, thousand ;
 //   integer i = 4'h0, j = 4'h0;
    wire clkdigit;
    clk_div #(.target_hz(240)) clk1 (.in_clk(clk), .out_clk(clkdigit));
	
always@(posedge clk) begin	 
     if(~rstb == 1'b0) begin          // Synchronous reset
//         DIGIT <= 4'he;  
        idle_count <= 0;           // IDLE counter + flag to 0
        idle_count_flag <= 1'b0;
        state_count <= 0;          // State counter + flag to 0
        state_count_flag <= 1'b0;
        data_count <= 0;           // Data counter + flag to 0
        data_count_flag <= 1'b0;
        bit_count <= 0;            // Bit counter to 0
        CurrentState <= IDLE;     // CurrentState becomes IDLE
        data <= 32'h00000000;   // Data builder to 0
        data_ready <= 1'b0;         // Data ready flag to 0
        oData <= 8'h00;  // Display 0s as output
		end 
      else begin
        CurrentState <= NextState;
 // case (CurrentState)
 //   IDLE:  oData  <= 8'h0f;
 //   Guidance :  oData <= 8'hf0;
//    DataRead :  oData  <= 8'hff;
//    endcase
        // Set IDLE flag
        if((CurrentState == IDLE) && (iIRDA == 1'b0)) begin
          idle_count_flag <= 1'b1;
 //        oData[7]  <= 1'b1;
  //        oData <= 8'h10;
          end
        else begin
          idle_count_flag <= 1'b0;
        
	//	       oData[0]  <= 1'b1;	
end

        // If IDLE flag, count with IDLE counter
        if(idle_count_flag == 1'b1) 
          idle_count <= idle_count + 1;
        else
          idle_count <= 0;
        
//		  		       oData(1) <= 1'b1;	
        // Set State flag
        if((CurrentState == Guidance) && (iIRDA == 1'b1)) 
          state_count_flag <= 1'b1;
        else begin
          state_count_flag <= 1'b0;
 //       		       oData[1]  <= 1'b1;	
//	  		       oData(2) <= 1'b1;	
end
        // If State flag, count with State counter
        if(state_count_flag == 1'b1) 
          state_count <= state_count + 1;
        else
          state_count <= 0;
        
//		  		       oData(3) <= 1'b1;	
        // Set Data flag
        if((CurrentState == DataRead) && ( iIRDA == 1'b1))  begin
          data_count_flag <= 1'b1;
//           oData[5]  <= 1'b1;	
           end
        else begin
          data_count_flag <= 1'b0;
 //         		       oData[2]  <= 1'b1;	
          		       end
        
//		  		       oData(4) <= 1'b1;	
        // If Data flag, count with Data counter
        if(data_count_flag == 1'b1) begin
          data_count <= data_count + 1;
//          		       oData[6]  <= 1'b1;	
          		       end
        else
          data_count <= 0;
        
//		  		       oData(5) <= 1'b1;	
        // If under DataRead, increment Bit counter every BIT_AVAILABLE_DUR + fill Data vector
        if(CurrentState == DataRead) begin
//         oData[4]  <= 1'b1;	
          // Increment Bit counter
          if(data_count == BIT_AVAILABLE_DUR) 
            bit_count <= bit_count + 1;
          
          // Fill Data vector
          if(data_count >= DATA_HIGH_DUR) 
            data[bit_count-1] <= 1'b1;
        end

          
          
         
//			 		       oData(6) <= 1'b1;	
        else begin
          bit_count <= 0;
          data <= 32'h00000000;
//			 		       oData(7) <= 1'b1;	
        end
	  
        // Listen to Bit counter and enable Data ready if applicable
        if(bit_count == 32) begin
          if(data[31:24] == ~data[23:16]) begin
            // Update Data register + enable Data ready flag
            data_reg <= data;
            data_ready <= 1'b1;

	 		end		
          else
            data_ready <= 1'b0;
           end
        else
          data_ready <= 1'b0;
        end 
        // If Data ready is active, then update output Data
        if(data_ready == 1'b1) 
          oData <= data_reg[23:16];
          
  oDataReady <= ~data_ready;
     
        end 

always@(CurrentState, NextState, idle_count,state_count,data_count,bit_count ) begin
   case (CurrentState)
  //    IDLE: begin
       IDLE: begin    
//					       oData <= 8'h0f;	
        if(idle_count > GUIDE_LOW_DUR)
          NextState <= Guidance;

        else
          NextState <= IDLE;
        end
 //     Guidance: begin
      Guidance: begin
//					       oData <= 8'hf0;				
        if(state_count > GUIDE_HIGH_DUR) 
          NextState <= DataRead;
        else
          NextState <= Guidance;
        end
//      DataRead: begin
        DataRead: begin
//							       oData <= 8'hff;	
        if((data_count >= IDLE_HIGH_DUR ) || (bit_count >= 33)) 
          NextState <= IDLE;
        else
          NextState <= DataRead;
        end
      default: NextState <= IDLE;
    endcase
  end

always@(*) begin
 A <= data_reg[19:16];
 B <= data_reg[23:20];     
 end
	 
always@(posedge clkdigit) begin

case (DIGIT)
            4'he: DIGIT = 4'hd;
            4'hd: DIGIT = 4'hb;
            4'hb: DIGIT = 4'h7;
            4'h7: DIGIT = 4'he;
        endcase
  end
 
    // Turn On given FND
    
    always@(posedge clk) begin
       case(DIGIT)
         4'he: begin 
                 case(A)
            4'h0: SEG = 8'hfc;
            4'h1: SEG = 8'h60;
            4'h2: SEG = 8'hda;
            4'h3: SEG = 8'hf2;
            4'h4: SEG = 8'h66;
            4'h5: SEG = 8'hb6;
            4'h6: SEG = 8'hbe;
            4'h7: SEG = 8'he0;
            4'h8: SEG = 8'hfe;
            4'h9: SEG = 8'he6;
            4'ha: SEG = 8'hee;
            4'hb: SEG = 8'h3e;
            4'hc: SEG = 8'h9c;
            4'hd: SEG = 8'h7a;
            4'he: SEG = 8'h9e;
            4'hf: SEG = 8'h8e;
        endcase
//         DIGIT = 4'hd;
         end 
                         4'hd: begin 
                 case(B)
            4'h0: SEG = 8'hfc;
            4'h1: SEG = 8'h60;
            4'h2: SEG = 8'hda;
            4'h3: SEG = 8'hf2;
            4'h4: SEG = 8'h66;
            4'h5: SEG = 8'hb6;
            4'h6: SEG = 8'hbe;
            4'h7: SEG = 8'he0;
            4'h8: SEG = 8'hfe;
            4'h9: SEG = 8'he6;
            4'ha: SEG = 8'hee;
            4'hb: SEG = 8'h3e;
            4'hc: SEG = 8'h9c;
            4'hd: SEG = 8'h7a;
            4'he: SEG = 8'h9e;
            4'hf: SEG = 8'h8e;
        endcase
        end
         4'hb: begin
         //               SEG = 8'h66;
         SEG = 8'h00;
  //       DIGIT = 4'h7;
         end
                 4'h7: begin
         //               SEG = 8'h66;
         SEG = 8'h00;
  //       DIGIT = 4'h7;
         end
 
   endcase
 

    end
//        always@(posedge clk) begin
//        case(order)
//            4'h1: digit = 4'he;
//            4'h2: digit = 4'hd;
//            4'h3: digit = 4'hb;
 //           4'h4: digit = 4'h7;
 //       endcase
//    end
   
endmodule
