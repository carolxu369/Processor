module min_setx(OP, sig_setx);
	// min stands for Minterms
	// here we got just one term: sig_setx = OP[4] AND OP[3]' AND ...
	input [4:0] OP;
	output sig_setx;
	
	and myOP_and (sig_setx, OP[4], ~OP[3], OP[2], ~OP[1], OP[0]);
	
endmodule
