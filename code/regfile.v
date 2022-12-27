module regfile (
    clock,
    ctrl_writeEnable,
    ctrl_reset, ctrl_writeReg,
    ctrl_readRegA, ctrl_readRegB, data_writeReg,
    data_readRegA, data_readRegB
);

   input clock, ctrl_writeEnable, ctrl_reset;
   input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
   input [31:0] data_writeReg;

   output [31:0] data_readRegA, data_readRegB;

   /* YOUR CODE HERE */
	// WRITE PORT
	wire [31:0] REG_EN;
	// module write_port(WR_REG, wr_en, REG_EN);
	write_port write_port0(ctrl_writeReg, ctrl_writeEnable, REG_EN);
	//module register_list(
	//DATA_WR,
	//Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7,
	//Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15,
	//Q16, Q17, Q18, Q19, Q20, Q21, Q22, Q23,
	//Q24, Q25, Q26, Q27, Q28, Q29, Q30, Q31,
	//clk, EN, clr);
	wire [31:0] Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15;
	wire [31:0] Q16, Q17, Q18, Q19, Q20, Q21, Q22, Q23, Q24, Q25, Q26, Q27, Q28, Q29, Q30, Q31;
	register_list register_list0(data_writeReg, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15, Q16, Q17, Q18, Q19, Q20, Q21, Q22, Q23, Q24, Q25, Q26, Q27, Q28, Q29, Q30, Q31, clock, REG_EN, ctrl_reset);
	
	//module read_port(
	//Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7,
	//Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15,
	//Q16, Q17, Q18, Q19, Q20, Q21, Q22, Q23,
	//Q24, Q25, Q26, Q27, Q28, Q29, Q30, Q31,
	//RD_REG,
	//DATA_READ);
	read_port read_portA(Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15, Q16, Q17, Q18, Q19, Q20, Q21, Q22, Q23, Q24, Q25, Q26, Q27, Q28, Q29, Q30, Q31, ctrl_readRegA, data_readRegA);
	read_port read_portB(Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15, Q16, Q17, Q18, Q19, Q20, Q21, Q22, Q23, Q24, Q25, Q26, Q27, Q28, Q29, Q30, Q31, ctrl_readRegB, data_readRegB);

	
endmodule
