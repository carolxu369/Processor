module min_jr(OP, sig_jr);
	// min stands for Minterms
	// here we got just one term: sig_jr = OP[4]' AND OP[3]' AND ...
	input [4:0] OP;
	output sig_jr;
	
	and myOP_and (sig_jr, ~OP[4], ~OP[3], OP[2], ~OP[1], ~OP[0]);
	
endmodule
