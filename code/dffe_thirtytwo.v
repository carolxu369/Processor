module dffe_thirtytwo(Q, D, clk, en, clr);
	// a single 32-bit dffe
	input [31:0] D;
	input clk, en, clr;
	output [31:0] Q;
	
	// module dffe_ref(q, d, clk, en, clr);
	dffe_ref dffe_ref0 (Q[0], D[0], clk, en, clr);
	dffe_ref dffe_ref1 (Q[1], D[1], clk, en, clr);
	dffe_ref dffe_ref2 (Q[2], D[2], clk, en, clr);
	dffe_ref dffe_ref3 (Q[3], D[3], clk, en, clr);
	dffe_ref dffe_ref4 (Q[4], D[4], clk, en, clr);
	dffe_ref dffe_ref5 (Q[5], D[5], clk, en, clr);
	dffe_ref dffe_ref6 (Q[6], D[6], clk, en, clr);
	dffe_ref dffe_ref7 (Q[7], D[7], clk, en, clr);
	dffe_ref dffe_ref8 (Q[8], D[8], clk, en, clr);
	dffe_ref dffe_ref9 (Q[9], D[9], clk, en, clr);
	dffe_ref dffe_ref10 (Q[10], D[10], clk, en, clr);
	dffe_ref dffe_ref11 (Q[11], D[11], clk, en, clr);
	dffe_ref dffe_ref12 (Q[12], D[12], clk, en, clr);
	dffe_ref dffe_ref13 (Q[13], D[13], clk, en, clr);
	dffe_ref dffe_ref14 (Q[14], D[14], clk, en, clr);
	dffe_ref dffe_ref15 (Q[15], D[15], clk, en, clr);
	dffe_ref dffe_ref16 (Q[16], D[16], clk, en, clr);
	dffe_ref dffe_ref17 (Q[17], D[17], clk, en, clr);
	dffe_ref dffe_ref18 (Q[18], D[18], clk, en, clr);
	dffe_ref dffe_ref19 (Q[19], D[19], clk, en, clr);
	dffe_ref dffe_ref20 (Q[20], D[20], clk, en, clr);
	dffe_ref dffe_ref21 (Q[21], D[21], clk, en, clr);
	dffe_ref dffe_ref22 (Q[22], D[22], clk, en, clr);
	dffe_ref dffe_ref23 (Q[23], D[23], clk, en, clr);
	dffe_ref dffe_ref24 (Q[24], D[24], clk, en, clr);
	dffe_ref dffe_ref25 (Q[25], D[25], clk, en, clr);
	dffe_ref dffe_ref26 (Q[26], D[26], clk, en, clr);
	dffe_ref dffe_ref27 (Q[27], D[27], clk, en, clr);
	dffe_ref dffe_ref28 (Q[28], D[28], clk, en, clr);
	dffe_ref dffe_ref29 (Q[29], D[29], clk, en, clr);
	dffe_ref dffe_ref30 (Q[30], D[30], clk, en, clr);
	dffe_ref dffe_ref31 (Q[31], D[31], clk, en, clr);
	
endmodule
