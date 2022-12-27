module tribuffer_thirtytwo(
	Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7,
	Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15,
	Q16, Q17, Q18, Q19, Q20, Q21, Q22, Q23,
	Q24, Q25, Q26, Q27, Q28, Q29, Q30, Q31,
	tri_EN,
	DATA_OUT);
	
	// 32 number of 32-bit tri-state buffers
	
	input [31:0] Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15;
	input [31:0] Q16, Q17, Q18, Q19, Q20, Q21, Q22, Q23, Q24, Q25, Q26, Q27, Q28, Q29, Q30, Q31;
	input [31:0] tri_EN;
	output [31:0] DATA_OUT;
	
	assign DATA_OUT = tri_EN[0] ? Q0 : 32'hzzzzzzzz;
	assign DATA_OUT = tri_EN[1] ? Q1 : 32'hzzzzzzzz;
	assign DATA_OUT = tri_EN[2] ? Q2 : 32'hzzzzzzzz;
	assign DATA_OUT = tri_EN[3] ? Q3 : 32'hzzzzzzzz;
	assign DATA_OUT = tri_EN[4] ? Q4 : 32'hzzzzzzzz;
	assign DATA_OUT = tri_EN[5] ? Q5 : 32'hzzzzzzzz;
	assign DATA_OUT = tri_EN[6] ? Q6 : 32'hzzzzzzzz;
	assign DATA_OUT = tri_EN[7] ? Q7 : 32'hzzzzzzzz;
	
	assign DATA_OUT = tri_EN[8] ? Q8 : 32'hzzzzzzzz;
	assign DATA_OUT = tri_EN[9] ? Q9 : 32'hzzzzzzzz;
	assign DATA_OUT = tri_EN[10] ? Q10 : 32'hzzzzzzzz;
	assign DATA_OUT = tri_EN[11] ? Q11 : 32'hzzzzzzzz;
	assign DATA_OUT = tri_EN[12] ? Q12 : 32'hzzzzzzzz;
	assign DATA_OUT = tri_EN[13] ? Q13 : 32'hzzzzzzzz;
	assign DATA_OUT = tri_EN[14] ? Q14 : 32'hzzzzzzzz;
	assign DATA_OUT = tri_EN[15] ? Q15 : 32'hzzzzzzzz;
	
	assign DATA_OUT = tri_EN[16] ? Q16 : 32'hzzzzzzzz;
	assign DATA_OUT = tri_EN[17] ? Q17 : 32'hzzzzzzzz;
	assign DATA_OUT = tri_EN[18] ? Q18 : 32'hzzzzzzzz;
	assign DATA_OUT = tri_EN[19] ? Q19 : 32'hzzzzzzzz;
	assign DATA_OUT = tri_EN[20] ? Q20 : 32'hzzzzzzzz;
	assign DATA_OUT = tri_EN[21] ? Q21 : 32'hzzzzzzzz;
	assign DATA_OUT = tri_EN[22] ? Q22 : 32'hzzzzzzzz;
	assign DATA_OUT = tri_EN[23] ? Q23 : 32'hzzzzzzzz;
	
	assign DATA_OUT = tri_EN[24] ? Q24 : 32'hzzzzzzzz;
	assign DATA_OUT = tri_EN[25] ? Q25 : 32'hzzzzzzzz;
	assign DATA_OUT = tri_EN[26] ? Q26 : 32'hzzzzzzzz;
	assign DATA_OUT = tri_EN[27] ? Q27 : 32'hzzzzzzzz;
	assign DATA_OUT = tri_EN[28] ? Q28 : 32'hzzzzzzzz;
	assign DATA_OUT = tri_EN[29] ? Q29 : 32'hzzzzzzzz;
	assign DATA_OUT = tri_EN[30] ? Q30 : 32'hzzzzzzzz;
	assign DATA_OUT = tri_EN[31] ? Q31 : 32'hzzzzzzzz;
	
endmodule
