module cl_four(c0, Pg7, Gg7, Pg15_, Gg15_, Pg23_, Gg23_, Cg1, Cg2, Cg3);
	// 4-bit carry-lookahead module, NOT an adder though
	// should in fact has an output as carry-out, and Pg31_, Gg31_ as inputs, but not required by this project
	input c0, Pg7, Gg7, Pg15_, Gg15_, Pg23_, Gg23_;
	//output C_out;
	output Cg1, Cg2, Cg3;
	
	// as shown in cla_eight() code would be implemented based on gate delays
	// 1st & 2nd gate delay (SOP operation)
	// for Cg1
	wire Pg7C0;
	and andPg7C0(Pg7C0, Pg7, c0);
	or or_Cg1(Cg1, Gg7, Pg7C0);
	// for Cg2
	wire Pg15_Gg7, Pg15_Pg7C0;
	and andPg15_Gg7(Pg15_Gg7, Pg15_, Gg7);
	and andPg15_Pg7C0(Pg15_Pg7C0, Pg15_, Pg7, c0);
	or or_Cg2(Cg2, Gg15_, Pg15_Gg7, Pg15_Pg7C0);
	// for Cg3
	wire Pg23_Gg15_, Pg23_Pg15_Gg7, Pg23_Pg15_Pg7C0;
	and andPg23_Gg15_(Pg23_Gg15_, Pg23_, Gg15_);
	and andPg23_Pg15_Gg7(Pg23_Pg15_Gg7, Pg23_, Pg15_, Gg7);
	and andPg23_pg15_Pg7C0(Pg23_Pg15_Pg7C0, Pg23_, Pg15_, Pg7, c0);
	or or_Cg3(Cg3, Gg23_, Pg23_Gg15_, Pg23_Pg15_Gg7, Pg23_Pg15_Pg7C0);

endmodule
