module singledot (
      input clk,
	  input [2:0] num,
      output reg clk_out,
      output reg data_out,
      output reg load
    );

localparam [3:0] 
    init_1 = 4'h0,
    init_2 = 4'h1,
    init_3 = 4'h2,
    init_4 = 4'h3,
    read_data = 4'h4,
    dig_7 = 4'h5,
    dig_6 = 4'h6,
    dig_5 = 4'h7,
    dig_4 = 4'h8,
    dig_3 = 4'h9,
    dig_2 = 4'ha,
    dig_1 = 4'hb,
    dig_0 = 4'hc;



localparam [2:0] 
    idle  = 3'b000,
    start = 3'b001,
    clk_data = 3'b010,
    clk_high = 3'b011,
    clk_low = 3'b100,
    finished = 3'b101;
   

reg [2:0] driver_state = idle;
reg [3:0] state = idle;
reg [63:0] latch_in = 64'h0000000000000000;
reg [15:0] command = 16'h0000;

reg [4:0]  counter = 0;
reg [7:0] clk_counter = 0;
reg [7:0] dig7_data = 8'h01;
reg [7:0] dig6_data = 8'h02;
reg [7:0] dig5_data = 8'h04;
reg [7:0] dig4_data = 8'h08;
reg [7:0] dig3_data = 8'h10;
reg [7:0] dig2_data = 8'h20;
reg [7:0] dig1_data = 8'h40;
reg [7:0] dig0_data = 8'h80;


reg [63:0] one = {8'h0C,  8'h0E,  8'h0C,  8'h0C,  8'h0C,  8'h0C,  8'h3F,  8'h00} ;	    // numeric 1
reg [63:0] two =  { 8'h1E,  8'h33,  8'h30,  8'h1C,  8'h06,  8'h33,  8'h3F,  8'h00} ;    // numeric 2
reg [63:0] three = {8'h1E,  8'h33,  8'h30,  8'h1C,  8'h30,  8'h33,  8'h1E,  8'h00} ;    // numeric 3
reg [63:0] four =  {8'h38,  8'h3C,  8'h36,  8'h33,  8'h7F,  8'h30,  8'h78,  8'h00} ;	// numeric 4
reg [63:0] off =  {8'h00,  8'h00,  8'h00,  8'h00,  8'h00,  8'h00,  8'h00,  8'h00} ;	// off 
wire onehzClk;
integer icount = 1;

// right most bit is MSB
parameter [63:0] smile = 	{8'h00, 8'h00, 8'h66, 8'h66, 8'h00, 8'h00, 8'h42, 8'h7e};											
parameter [63:0] sup   = 	{8'h00, 8'h00, 8'h66, 8'h66, 8'h00, 8'h3c, 8'h24, 8'h3c};
//parameter [63:0] smile = 	{8'h7e, 8'h42, 8'h00, 8'h00, 8'h66, 8'h66, 8'h00, 8'h00};											
//parameter [63:0] sup   = 	{8'h3c, 8'h24, 8'h3c, 8'h00, 8'h66, 8'h66, 8'h00, 8'h00};


always @(posedge clk) begin

        case (state) 
            init_1: begin
                  if (driver_state == idle) begin
                    command <= 16'h0c01; // shutdown / normal operation
                    driver_state <= start;
                    state <= init_2;
                   end
                  end 
            init_2: begin 
                  if (driver_state == idle) begin 
                    command <= 16'h0900; //decode mode
                    driver_state <= start;
                    state <= init_3;
                   end
                  end 
            init_3: begin
                  if (driver_state == idle) begin
                    command <= 16'h0a00; // intensity
                    driver_state <= start;
                    state <= init_4;
                   end
                  end
            init_4: begin
                  if (driver_state == idle) begin
                    command <= 16'h0b07; // scan limit
                    driver_state <= start;
                    state <= read_data;
                  end 
                 end
            read_data: begin
            
                    dig7_data <= latch_in[63:56];
                    dig6_data <= latch_in[55:48];					
                    dig5_data <= latch_in[47:40];
                    dig4_data <= latch_in[39:32];
                    dig3_data <= latch_in[31:24];
                    dig2_data <= latch_in[23:16];
                    dig1_data <= latch_in[15:8];			  
                    dig0_data <= latch_in[7:0];

                    state <= dig_7;
                   end
            dig_7: begin
                  if (driver_state == idle) begin
                    command <= {8'h01, dig0_data}; 
                    driver_state <= start;
                    state <= dig_6;
                  end 
                 end
            dig_6: begin
                  if (driver_state == idle) begin
                    command <= {8'h02, dig1_data}; 
                    driver_state <= start;
                    state <= dig_5;
                  end 
                  end
            dig_5: begin
                  if (driver_state == idle) begin
                    command <= {8'h03, dig2_data}; 
                    driver_state <= start;
                    state <= dig_4;
                  end 
                  end
            dig_4: begin
                  if (driver_state == idle) begin
                    command <= {8'h04, dig3_data}; 
                    driver_state <= start;
                    state <= dig_3;
                  end 
                  end
            dig_3: begin
                  if (driver_state == idle) begin
                    command <= {8'h05, dig4_data}; 
                    driver_state <= start;
                    state <= dig_2;
                  end 
                  end
            dig_2: begin
                  if (driver_state == idle) begin
                    command <= {8'h06, dig5_data}; 
                    driver_state <= start;
                    state <= dig_1;
                  end 
                  end
            dig_1: begin
                  if (driver_state == idle) begin
                    command <= {8'h07, dig6_data}; 
                    driver_state <= start;
                    state <= dig_0;
                  end 
                  end
            dig_0: begin
                  if (driver_state == idle) begin
                    command <= {8'h08, dig7_data}; 
                    driver_state <= start;
                    state <= read_data;
                  end
                  end
           default: ;
          endcase

      if (clk_counter < 100) 
          clk_counter = clk_counter + 1;  //
      else begin
        clk_counter <= 0;   //
        case (driver_state)
          idle: begin
              load <= 1'b1;
              clk_out <= 1'b0;
                end
          start: begin
              load <= 1'b0;
              counter = 16;  //
              driver_state <= clk_data;
              end
          clk_data: begin
              counter = counter - 1;  //
              data_out <= command[counter];  //
              driver_state <= clk_high;
             end
          clk_high: begin
              clk_out <= 1'b1;
              driver_state <= clk_low;
             end
          clk_low: begin
              clk_out <= 1'b0;
             if (counter == 0) begin
                 load <= 1'b1;
                 driver_state <= finished;
                 end
             else
                 driver_state <= clk_data;
             
             end
          finished: driver_state <= idle;
         default: ;
         endcase
        end 
        
  end 

clk_div # (.target_hz(1)) clk1hz(.in_clk(clk), .out_clk(onehzClk));
assign onehzClk = onehzClk;

always @(num) begin		
case (num)
 3'b000: 	latch_in = off ;
 3'b001: 	latch_in = one ;
 3'b010: 	latch_in = two ;
 3'b011: 	latch_in = three ;
 3'b100: 	latch_in = four ;
 default: 	latch_in = off ;
 endcase
	end


endmodule