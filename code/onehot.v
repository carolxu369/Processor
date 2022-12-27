module onehot(OPcode, ALUOPcode, sigadd, sigaddi, sigsub, sigand, sigor, sigsll, sigsra, sigsw, siglw,
sigj, sigbne, sigjal, sigjr, sigblt, sigbex, sigsetx);
	// an onehot decoder that reads all of the opcodes
	// and generates onehot encoding of the operations
	// except jump and branch type

	input [4:0] OPcode, ALUOPcode;
	output sigadd, sigaddi, sigsub, sigand, sigor, sigsll, sigsra, sigsw, siglw;
	output sigj, sigbne, sigjal, sigjr, sigblt, sigbex, sigsetx;

	min_add mymin_add (OPcode, ALUOPcode, sigadd);
	min_addi mymin_addi (OPcode, sigaddi);
	min_sub mymin_sub (OPcode, ALUOPcode, sigsub);
	min_and mymin_and (OPcode, ALUOPcode, sigand);
	min_or mymin_or (OPcode, ALUOPcode, sigor);
	min_sll mymin_sll (OPcode, ALUOPcode, sigsll);
	min_sra mymin_sra (OPcode, ALUOPcode, sigsra);
	min_sw mymin_sw (OPcode, sigsw);
	min_lw mymin_lw (OPcode, siglw);
	
	min_j mymin_j(OPcode, sigj);
	min_bne mymin_bne(OPcode, sigbne);
	min_jal mymin_jal(OPcode, sigjal);
	min_jr mymin_jr(OPcode, sigjr);
	min_blt mymin_blt(OPcode, sigblt);
	min_bex myimin_bex(OPcode, sigbex);
	min_setx mymin_setx(OPcode, sigsetx);

endmodule
