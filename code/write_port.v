module write_port(WR_REG, wr_en, REG_EN);
	// implementing the write-port
	
	input [4:0] WR_REG;
	input wr_en;
	output [31:0] REG_EN;
	
	wire [31:0] REGISTER;
	
	// module decoder_five(A, D);
	decoder_five decoder_five0(WR_REG[4:0], REGISTER[31:0]);
	
	// and(Y, A, B);
	and and0(REG_EN[0], REGISTER[0], wr_en);
	and and1(REG_EN[1], REGISTER[1], wr_en);
	and and2(REG_EN[2], REGISTER[2], wr_en);
	and and3(REG_EN[3], REGISTER[3], wr_en);
	and and4(REG_EN[4], REGISTER[4], wr_en);
	and and5(REG_EN[5], REGISTER[5], wr_en);
	and and6(REG_EN[6], REGISTER[6], wr_en);
	and and7(REG_EN[7], REGISTER[7], wr_en);
	
	and and8(REG_EN[8], REGISTER[8], wr_en);
	and and9(REG_EN[9], REGISTER[9], wr_en);
	and and10(REG_EN[10], REGISTER[10], wr_en);
	and and11(REG_EN[11], REGISTER[11], wr_en);
	and and12(REG_EN[12], REGISTER[12], wr_en);
	and and13(REG_EN[13], REGISTER[13], wr_en);
	and and14(REG_EN[14], REGISTER[14], wr_en);
	and and15(REG_EN[15], REGISTER[15], wr_en);
	
	and and16(REG_EN[16], REGISTER[16], wr_en);
	and and17(REG_EN[17], REGISTER[17], wr_en);
	and and18(REG_EN[18], REGISTER[18], wr_en);
	and and19(REG_EN[19], REGISTER[19], wr_en);
	and and20(REG_EN[20], REGISTER[20], wr_en);
	and and21(REG_EN[21], REGISTER[21], wr_en);
	and and22(REG_EN[22], REGISTER[22], wr_en);
	and and23(REG_EN[23], REGISTER[23], wr_en);
	
	and and24(REG_EN[24], REGISTER[24], wr_en);
	and and25(REG_EN[25], REGISTER[25], wr_en);
	and and26(REG_EN[26], REGISTER[26], wr_en);
	and and27(REG_EN[27], REGISTER[27], wr_en);
	and and28(REG_EN[28], REGISTER[28], wr_en);
	and and29(REG_EN[29], REGISTER[29], wr_en);
	and and30(REG_EN[30], REGISTER[30], wr_en);
	and and31(REG_EN[31], REGISTER[31], wr_en);
	
endmodule
