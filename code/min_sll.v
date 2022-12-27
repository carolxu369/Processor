module min_sll(OP, ALUOP, sig_sll);
	// min stands for Minterms
	// here we got just one term: sig_sll = OP[0]' AND OP[1]' AND ...
	input [4:0] OP, ALUOP;
	output sig_sll;
	
	wire op_and, aluop_and;
	and myOP_and (op_and, ~OP[4], ~OP[3], ~OP[2], ~OP[1], ~OP[0]);
	and myALUOP_and (aluop_and, ~ALUOP[4], ~ALUOP[3], ALUOP[2], ~ALUOP[1], ~ALUOP[0]);
	
	and final (sig_sll, op_and, aluop_and);
	
endmodule
