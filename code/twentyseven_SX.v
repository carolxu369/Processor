module twentyseven_SX(T, T_extended);
	// sign-extension unit: 27 to 32
	input [26:0] T;
	output [31:0] T_extended;
	
	// perform sign-padding
	wire T_sign;
	assign T_sign = T[26];
	
	wire [4:0] T_sign_five = {5{T_sign}};
	assign T_extended = {T_sign_five, T};
	
endmodule
