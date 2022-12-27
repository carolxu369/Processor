module cla_three(A, B, c0, S, Pg, Gg);
	// 3-bit CLA block
	input [2:0] A, B;
	input c0; // carry-in
	output [2:0] S; // output sum
	output Pg, Gg; // group propagate and group generate
	
	// ignoring fan-in, this block should cost 4 gate delays
	// the following code would be written based on the order of gate delays
	
	// 1st gate delay
	wire [2:0] G, P;
	
	and and2(G[2], A[2], B[2]);
	and and1(G[1], A[1], B[1]);
	and and0(G[0], A[0], B[0]);
	
	xor xor2(P[2], A[2], B[2]);
	xor xor1(P[1], A[1], B[1]);
	xor xor0(P[0], A[0], B[0]);
	
	// 2nd & 3rd gate delay (due to SOP operation)
	// group-generate and propagate, c3 and p3 to be exact
	wire P2G1, P2P1G0;
	and and21(P2G1, P[2], G[1]);
	and and210(P2P1G0, P[2], P[1], G[0]);
	or or_Gg2(Gg, G[2], P2G1, P2P1G0);
	
	and and_Pg2(Pg, P[2], P[1], P[0]);
	
	// in parallel action, all of the carry bits are generated
	wire c2, c1; // c0 is the input and thus has been declared
	wire P1G0, P1P0C0;
	wire P0C0;
	
	// for c2
	and and10(P1G0, P[1], G[0]);
	and and1c0(P1P0C0, P[1], P[0], c0);
	or or_C2(c2, G[1], P1G0, P1P0C0);
	// for c1
	and andc0(P0C0, P[0], c0);
	or or_C1(c1, G[0], P0C0);
	// c0 is just c0 as input
	
	// 4th gate delay
	// for generating sum bits S = P XOR C_in
	xor xorsum2(S[2], P[2], c2);
	xor xorsum1(S[1], P[1], c1);
	xor xorsum0(S[0], P[0], c0);
	
endmodule
