module seventeen_SX(IMM, IMM_signed);
	// sign-extension unit: 17 to 32
	input [16:0] IMM;
	output [31:0] IMM_signed;
	
	// perform sign-padding
	wire imm_sign;
	assign imm_sign = IMM[16];
	
	wire [14:0] IMM_sign_fifteen = {15{imm_sign}};
	assign IMM_signed = {IMM_sign_fifteen, IMM};
	
endmodule
