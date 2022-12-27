module min_lw(OP, sig_lw);
	// min stands for Minterms
	// here we got just one term: sig_sw = OP[4]' AND OP[3]' AND ...
	input [4:0] OP;
	output sig_lw;
	
	and myOP_and (sig_lw, ~OP[4], OP[3], ~OP[2], ~OP[1], ~OP[0]);
	
endmodule
