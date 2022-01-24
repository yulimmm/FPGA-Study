module PA #(paramter size=32)(
	co,
	s,
//	ci,  지운이유는? c in 인데 처음엔 c in이 없으니까. 나머지 c in은 와이어가 만들어줌.
	i0,
	i1
	);

	output co;
	output [size-1:0]s;
	input [size-1:0]i0;
	input [size-1:0]i1;

	wire [size-1:0]c_o;

	assign co = c_o[size-1];

	genvar i;
	generate
		for(i=0; i<size; i=i+1)
		begin:FA //FA로 이름 바뀜. 
			if(i==0)
				FA fa(.carry_out(c_o[i]), .sum(s[i]), .carry_in(1'b0), .a(i0[i]), .b(i1[i]));
			else
				FA fa(.carry_out(c_o[i]), .sum(s[i]), .carry_in(c_o[i-1]), .a(i0[i]), .b(i1[i]));
		end
	endgenerate
endmodule
