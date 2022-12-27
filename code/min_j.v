module min_j(OP, sig_j);
	// min stands for Minterms
	// here we got just one term: sig_jt = OP[4]' AND OP[3]' AND ...
	input [4:0] OP;
	output sig_j;
	
	and myOP_and (sig_j, ~OP[4], ~OP[3], ~OP[2], ~OP[1], OP[0]);
	
endmodule
