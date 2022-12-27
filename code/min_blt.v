module min_blt(OP, sig_blt);
	// min stands for Minterms
	// here we got just one term: sig_blt = OP[4]' AND OP[3]' AND ...
	input [4:0] OP;
	output sig_blt;
	
	and myOP_and (sig_blt, ~OP[4], ~OP[3], OP[2], OP[1], ~OP[0]);
	
endmodule
