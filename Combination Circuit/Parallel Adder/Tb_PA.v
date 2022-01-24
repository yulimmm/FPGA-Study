module Tb_PA();
	parameter size = 4;

	reg [size-1:0]in0;
	reg [size-1:0]in1;

	wire [size:0]sum;

	PA #(size) sim_pa(.co(sum[size]), .s(sum[size-1:0]), .i0(in0), .i1(in1));

	integer i;

	initial
	begin
		for(i=0; i<2**size;i=i+1)
		begin
			#100 in0 =$urandom%16; in1 = $urandom%16;
		end 
	end

endmodule
