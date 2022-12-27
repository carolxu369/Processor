module decoder_two(A, D);
	// a 2-to-4 decoder, serve as a component of 5-to-32 decoder
	
	input [1:0] A;
	output [3:0] D;
	
	wire n_Azero, n_Aone;
	
	// not(Y, A);
	not notA0(n_Azero, A[0]);
	not notA1(n_Aone, A[1]);
	
	// and(Y, A, B);
	and and0(D[0], n_Azero, n_Aone);
	and and1(D[1], A[0], n_Aone);
	and and2(D[2], n_Azero, A[1]);
	and and3(D[3], A[0], A[1]);
	
endmodule
