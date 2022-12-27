module twelve_SX(PC_AddOne, PC_AddOne_extended);
	// sign-extension unit: 12 to 32
	input [11:0] PC_AddOne;
	output [31:0] PC_AddOne_extended;
	
	// perform sign-padding
	wire pc_sign;
	assign pc_sign = PC_AddOne[11];
	
	wire [19:0] PC_sign_twenty = {20{pc_sign}};
	assign PC_AddOne_extended = {PC_sign_twenty, PC_AddOne};
	
endmodule
