module read_port(
	Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7,
	Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15,
	Q16, Q17, Q18, Q19, Q20, Q21, Q22, Q23,
	Q24, Q25, Q26, Q27, Q28, Q29, Q30, Q31,
	RD_REG,
	DATA_READ);
	
	// implement a read port
	
	input [31:0] Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15;
	input [31:0] Q16, Q17, Q18, Q19, Q20, Q21, Q22, Q23, Q24, Q25, Q26, Q27, Q28, Q29, Q30, Q31;
	input [4:0] RD_REG;
	output [31:0] DATA_READ;
	
	wire [31:0] tri_EN;
	
	// module decoder_five(A, D);
	decoder_five decoder_five0(RD_REG, tri_EN);
	
	//module tribuffer_thirtytwo(
	//Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7,
	//Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15,
	//Q16, Q17, Q18, Q19, Q20, Q21, Q22, Q23,
	//Q24, Q25, Q26, Q27, Q28, Q29, Q30, Q31,
	//tri_EN,
	//DATA_OUT);
	
	tribuffer_thirtytwo tribuffer_thirtytwo0(Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15, Q16, Q17, Q18, Q19, Q20, Q21, Q22, Q23, Q24, Q25, Q26, Q27, Q28, Q29, Q30, Q31, tri_EN, DATA_READ);
	
endmodule
