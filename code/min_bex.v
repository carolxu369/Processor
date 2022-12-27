module min_bex(OP, sig_bex);
	// min stands for Minterms
	// here we got just one term: sig_bex = OP[4] AND OP[3]' AND ...
	input [4:0] OP;
	output sig_bex;
	
	and myOP_and (sig_bex, OP[4], ~OP[3], OP[2], OP[1], ~OP[0]);
	
endmodule
