module const_test();
	reg const_gnd;
	
	initial begin
	const_gnd <= 0;
	
	#10
	$display("%b", {{7{const_gnd}},~const_gnd});
	end
endmodule
