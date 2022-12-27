module register_list(
	DATA_WR,
	Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7,
	Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15,
	Q16, Q17, Q18, Q19, Q20, Q21, Q22, Q23,
	Q24, Q25, Q26, Q27, Q28, Q29, Q30, Q31,
	clk, EN, clr);
	
	// A list of 32 DFFEs in the regfile
	
	input [31:0] DATA_WR, EN;
	input clk, clr;
	output [31:0] Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15;
	output [31:0] Q16, Q17, Q18, Q19, Q20, Q21, Q22, Q23, Q24, Q25, Q26, Q27, Q28, Q29, Q30, Q31;
	
	// module dffe(Q, D, clk, en, clr);
	
	//dffe_thirtytwo dffe0 (Q0, DATA_WR, clk, EN[0], clr);
	// register 0 is always zero
	dffe_thirtytwo dffe0 (Q0, 32'h00000000, clk, 1'b1, clr);
	dffe_thirtytwo dffe1 (Q1, DATA_WR, clk, EN[1], clr);
	dffe_thirtytwo dffe2 (Q2, DATA_WR, clk, EN[2], clr);
	dffe_thirtytwo dffe3 (Q3, DATA_WR, clk, EN[3], clr);
	dffe_thirtytwo dffe4 (Q4, DATA_WR, clk, EN[4], clr);
	dffe_thirtytwo dffe5 (Q5, DATA_WR, clk, EN[5], clr);
	dffe_thirtytwo dffe6 (Q6, DATA_WR, clk, EN[6], clr);
	dffe_thirtytwo dffe7 (Q7, DATA_WR, clk, EN[7], clr);
	
	dffe_thirtytwo dffe8 (Q8, DATA_WR, clk, EN[8], clr);
	dffe_thirtytwo dffe9 (Q9, DATA_WR, clk, EN[9], clr);
	dffe_thirtytwo dffe10 (Q10, DATA_WR, clk, EN[10], clr);
	dffe_thirtytwo dffe11 (Q11, DATA_WR, clk, EN[11], clr);
	dffe_thirtytwo dffe12 (Q12, DATA_WR, clk, EN[12], clr);
	dffe_thirtytwo dffe13 (Q13, DATA_WR, clk, EN[13], clr);
	dffe_thirtytwo dffe14 (Q14, DATA_WR, clk, EN[14], clr);
	dffe_thirtytwo dffe15 (Q15, DATA_WR, clk, EN[15], clr);
	
	dffe_thirtytwo dffe16 (Q16, DATA_WR, clk, EN[16], clr);
	dffe_thirtytwo dffe17 (Q17, DATA_WR, clk, EN[17], clr);
	dffe_thirtytwo dffe18 (Q18, DATA_WR, clk, EN[18], clr);
	dffe_thirtytwo dffe19 (Q19, DATA_WR, clk, EN[19], clr);
	dffe_thirtytwo dffe20 (Q20, DATA_WR, clk, EN[20], clr);
	dffe_thirtytwo dffe21 (Q21, DATA_WR, clk, EN[21], clr);
	dffe_thirtytwo dffe22 (Q22, DATA_WR, clk, EN[22], clr);
	dffe_thirtytwo dffe23 (Q23, DATA_WR, clk, EN[23], clr);
	
	dffe_thirtytwo dffe24 (Q24, DATA_WR, clk, EN[24], clr);
	dffe_thirtytwo dffe25 (Q25, DATA_WR, clk, EN[25], clr);
	dffe_thirtytwo dffe26 (Q26, DATA_WR, clk, EN[26], clr);
	dffe_thirtytwo dffe27 (Q27, DATA_WR, clk, EN[27], clr);
	dffe_thirtytwo dffe28 (Q28, DATA_WR, clk, EN[28], clr);
	dffe_thirtytwo dffe29 (Q29, DATA_WR, clk, EN[29], clr);
	dffe_thirtytwo dffe30 (Q30, DATA_WR, clk, EN[30], clr);
	dffe_thirtytwo dffe31 (Q31, DATA_WR, clk, EN[31], clr);
	
endmodule
