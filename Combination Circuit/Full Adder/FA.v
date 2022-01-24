module FA(
	carry_out,
	sum,
	carry_in,
	a,
	b
	);

	output carry_out;
	oputput sum;
	input carry_in;
	input a;
	input b;

	assign carry_out=(a&b)|((a^b)&carry_in);
	assign sum = a^b^carry_in;

endmodule
