/*module test(Q, D, clk, en, clr);
	// module dffe_PC(Q, D, clk, en, clr);
	// module PC_Adder(Address_previous, Address_next);
	
	input clk, en, clr;
	output [11:0] Q, D;
	
	dffe_PC PC (Q, D, clk, en, clr);
	PC_Adder Adder (Q, D);
	
endmodule*/

/*module test(OP, ALUOP, sig_add);
	input [4:0] OP, ALUOP;
	output sig_add;
	
	wire [4:0] andresult;
	
	and myand0 (andresult[0], ~OP[0], ~ALUOP[0]);
	and myand1 (andresult[1], ~OP[1], ~ALUOP[1]);
	and myand2 (andresult[2], ~OP[2], ~ALUOP[2]);
	and myand3 (andresult[3], ~OP[3], ~ALUOP[3]);
	and myand4 (andresult[4], ~OP[4], ~ALUOP[4]);
	
	and final (sig_add, andresult[0], andresult[1], andresult[2], andresult[3], andresult[4]);
	
endmodule*/

module test(OP, ALUOP, sig_add);
	input [4:0] OP, ALUOP;
	output sig_add;
	
	wire op_and, aluop_and;
	and myOP_and (op_and, ~OP[0], ~OP[1], ~OP[2], ~OP[3], ~OP[4]);
	and myALUOP_and (aluop_and, ~ALUOP[0], ~ALUOP[1], ~ALUOP[2], ~ALUOP[3], ~ALUOP[4]);
	
	and final (sig_add, op_and, aluop_and);
	
endmodule
