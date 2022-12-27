module decoder_five(A, D);
	// a 5-to-32 decoder
	
	input [4:0] A;
	output [31:0] D;
	
	wire [3:0] EN;
	
	// module decoder_two(A, D)
	decoder_two two_four(A[4:3], EN[3:0]);
	
	// module decoder_three(A, D, en);
	decoder_three three_eight0(A[2:0], D[7:0], EN[0]);
	decoder_three three_eight1(A[2:0], D[15:8], EN[1]);
	decoder_three three_eight2(A[2:0], D[23:16], EN[2]);
	decoder_three three_eight3(A[2:0], D[31:24], EN[3]);
	
endmodule
