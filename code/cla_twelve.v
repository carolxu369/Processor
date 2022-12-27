module cla_twelve (A, B, S);
	// 4 3-bit CLAs in one layer and cascaded above a 4-bit CL module
	input [11:0] A, B;
	//input c0;
	output [11:0] S;
	
	// to adapt to this project the initial carry-in bit c0 is zero, or GND
	// wire c0
	wire Pg2, Gg2, Pg5_, Gg5_, Pg8_, Gg8_, Pg11_, Gg11_, Cg1, Cg2, Cg3;
	// module cla_eight(A, B, c0, S, Pg, Gg);
	cla_three cla8_0 (A[2:0], B[2:0], 1'b0, S[2:0], Pg2, Gg2);
	cla_three cla8_1 (A[5:3], B[5:3], Cg1, S[5:3], Pg5_, Gg5_);
	cla_three cla8_2 (A[8:6], B[8:6], Cg2, S[8:6], Pg8_, Gg8_);
	cla_three cla8_3 (A[11:9], B[11:9], Cg3, S[11:9], Pg11_, Gg11_);
	
	
	// again, for this project the CL4 has no carry out bit
	cl_four cl4_0 (1'b0, Pg2, Gg2, Pg5_, Gg5_, Pg8_, Gg8_, Cg1, Cg2, Cg3);
	
endmodule
