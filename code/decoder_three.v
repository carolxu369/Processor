module decoder_three(A, D, en);
	// a 3-to-8 decoder, serve as a component of 5-to-32 decoder
	
	input [2:0] A;
	input en;
	output [7:0] D;
	
	wire n_Azero, n_Aone, n_Atwo;
	
	// not(Y, A);
	not notA0(n_Azero, A[0]);
	not notA1(n_Aone, A[1]);
	not notA2(n_Atwo, A[2]);
	
	// and(Y, A, B, C, D);
	and and0(D[0], n_Azero, n_Aone, n_Atwo, en);
	and and1(D[1], A[0], n_Aone, n_Atwo, en);
	and and2(D[2], n_Azero, A[1], n_Atwo, en);
	and and3(D[3], A[0], A[1], n_Atwo, en);
	and and4(D[4], n_Azero, n_Aone, A[2], en);
	and and5(D[5], A[0], n_Aone, A[2], en);
	and and6(D[6], n_Azero, A[1], A[2], en);
	and and7(D[7], A[0], A[1], A[2], en);
	
endmodule
	