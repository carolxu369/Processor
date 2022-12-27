module dffe_PC(Q, D, clk, en, clr);
	// a single 12-bit dffe
	input [11:0] D;
	input clk, en, clr;
	output [11:0] Q;
	
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
	
	
endmodule