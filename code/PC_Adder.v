module PC_Adder(Address_previous, Address_next);
	// just add one-bit for next instruction
	// module fullAdder(ina, inb, cin, cout, sum);
	input [11:0] Address_previous;
	output [11:0] Address_next;
	wire[11:0] cout;
	
	fullAdder fulladder0 (Address_previous[0], 1'b1, 1'b0, cout[0], Address_next[0]);
	fullAdder fulladder1 (Address_previous[1], 1'b0, cout[0], cout[1], Address_next[1]);
	fullAdder fulladder2 (Address_previous[2], 1'b0, cout[1], cout[2], Address_next[2]);
	fullAdder fulladder3 (Address_previous[3], 1'b0, cout[2], cout[3], Address_next[3]);
	fullAdder fulladder4 (Address_previous[4], 1'b0, cout[3], cout[4], Address_next[4]);
	fullAdder fulladder5 (Address_previous[5], 1'b0, cout[4], cout[5], Address_next[5]);
	fullAdder fulladder6 (Address_previous[6], 1'b0, cout[5], cout[6], Address_next[6]);
	fullAdder fulladder7 (Address_previous[7], 1'b0, cout[6], cout[7], Address_next[7]);
	fullAdder fulladder8 (Address_previous[8], 1'b0, cout[7], cout[8], Address_next[8]);
	fullAdder fulladder9 (Address_previous[9], 1'b0, cout[8], cout[9], Address_next[9]);
	fullAdder fulladder10 (Address_previous[10], 1'b0, cout[9], cout[10], Address_next[10]);
	fullAdder fulladder11 (Address_previous[11], 1'b0, cout[10], cout[11], Address_next[11]);
	
endmodule
