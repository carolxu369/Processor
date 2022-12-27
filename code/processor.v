/**
 * READ THIS DESCRIPTION!
 *
 * The processor takes in several inputs from a skeleton file.
 *
 * Inputs
 * clock: this is the clock for your processor at 50 MHz
 * reset: we should be able to assert a reset to start your pc from 0 (sync or
 * async is fine)
 *
 * Imem: input data from imem
 * Dmem: input data from dmem
 * Regfile: input data from regfile
 *
 * Outputs
 * Imem: output control signals to interface with imem
 * Dmem: output control signals and data to interface with dmem
 * Regfile: output control signals and data to interface with regfile
 *
 * Notes
 *
 * Ultimately, your processor will be tested by subsituting a master skeleton, imem, dmem, so the
 * testbench can see which controls signal you active when. Therefore, there needs to be a way to
 * "inject" imem, dmem, and regfile interfaces from some external controller module. The skeleton
 * file acts as a small wrapper around your processor for this purpose.
 *
 * You will need to figure out how to instantiate two memory elements, called
 * "syncram," in Quartus: one for imem and one for dmem. Each should take in a
 * 12-bit address and allow for storing a 32-bit value at each address. Each
 * should have a single clock.
 *
 * Each memory element should have a corresponding .mif file that initializes
 * the memory element to certain value on start up. These should be named
 * imem.mif and dmem.mif respectively.
 *
 * Importantly, these .mif files should be placed at the top level, i.e. there
 * should be an imem.mif and a dmem.mif at the same level as process.v. You
 * should figure out how to point your generated imem.v and dmem.v files at
 * these MIF files.
 *
 * imem
 * Inputs:  12-bit address, 1-bit clock enable, and a clock
 * Outputs: 32-bit instruction
 *
 * dmem
 * Inputs:  12-bit address, 1-bit clock, 32-bit data, 1-bit write enable
 * Outputs: 32-bit data at the given address
 *
 */
module processor(
    // Control signals
    clock,                          // I: The master clock
    reset,                          // I: A reset signal

    // Imem
    address_imem,                   // O: The address of the data to get from imem
    q_imem,                         // I: The data from imem

    // Dmem
    address_dmem,                   // O: The address of the data to get or put from/to dmem
    data,                           // O: The data to write to dmem
    wren,                           // O: Write enable for dmem
    q_dmem,                         // I: The data from dmem

    // Regfile
    ctrl_writeEnable,               // O: Write enable for regfile
    ctrl_writeReg,                  // O: Register to write to in regfile
    ctrl_readRegA,                  // O: Register to read from port A of regfile
    ctrl_readRegB,                  // O: Register to read from port B of regfile
    data_writeReg,                  // O: Data to write to for regfile
    data_readRegA,                  // I: Data from port A of regfile
    data_readRegB                   // I: Data from port B of regfile
	 
	 // for debug
);
    
	 // for debug
	 
	 // Control signals
    input clock, reset;

    // Imem
    output [11:0] address_imem;
    input [31:0] q_imem;

    // Dmem
    output [11:0] address_dmem;
    output [31:0] data;
    output wren;
    input [31:0] q_dmem;

    // Regfile
    output ctrl_writeEnable;
    output [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
    output [31:0] data_writeReg;
    input [31:0] data_readRegA, data_readRegB;
	 wire [4:0] ctrl_writeReg_beforeV;
	 wire [31:0] data_writeReg_beforeV;
	 wire [31:0] RW_data;

    /* YOUR CODE STARTS HERE */
	 
	 // PC
	 // module dffe_PC(Q, D, clk, en, clr);
	 // module PC_Adder(Address_previous, Address_next);
	 wire [11:0] PC_input, PC_AddOne, PC_input_beforeJR;
	 dffe_PC PC(address_imem, PC_input, clock, 1'b1, reset);
	 PC_Adder Next_address_adder (address_imem, PC_AddOne);
	 
	 // parsing instruction machine code
	 // R-Type
	 wire [4:0] OPcode, ALUOPcode_R, ALUOPcode, rd, rs, rt, shamt, zeroes;
	  
	 assign OPcode = q_imem[31:27];
	 assign rd = q_imem[26:22];
	 assign rs = q_imem[21:17];
	 assign rt = q_imem[16:12];
	 assign shamt = q_imem[11:7];
	 assign ALUOPcode_R = q_imem[6:2];
	 wire is_R;
	 and andaluopcode (is_R, ~OPcode[4], ~OPcode[3], ~OPcode[2], ~OPcode[1], ~OPcode[0]);
	 assign ALUOPcode = is_R ? ALUOPcode_R : 5'b00000;
	 assign zeroes = q_imem[1:0];
	 // I-Type
	 wire [16:0] IMM;
	 assign IMM = q_imem[16:0];
	 // new stuff
	 wire [26:0] T;
	 assign T = q_imem[26:0];
	 
	 // controller
	 wire ALUinB, wren, RWd;
	 wire sigbranchIMM, sigT;
	 wire sigadd, sigaddi, sigsub, sigand, sigor, sigsll, sigsra, sigsw, siglw;
	 wire sigj, sigbne, sigjal, sigjr, sigblt, sigbex, sigsetx;
	 //wire sigJI;
	 // onehot decoder
	 onehot myonehot (OPcode, ALUOPcode_R, sigadd, sigaddi, sigsub, sigand, sigor, sigsll, sigsra, sigsw, siglw, sigj, sigbne, sigjal, sigjr, sigblt, sigbex, sigsetx);
	 //or orJI (sigJI, sigj, sigjal, sigbex, sigsetx);
	 
	 // below needs to be changed!!!
	 // control signals
	 or or_ctrlwren (ctrl_writeEnable, sigadd, sigaddi, sigsub, sigand, sigor, sigsll, sigsra, siglw, sigjal, sigsetx);
	 or or_aluinb (ALUinB, sigaddi, sigsw, siglw);
	 assign wren = sigsw;
	 assign RWd = siglw;
	 wire bne_true, blt_true;
	 and bneand (bne_true, sigbne, isNotEqual);
	 wire not_lsthan_nor_eq, notisLessThan;
	 not notlessthan (notisLessThan, isLessThan);
	 and andlsthan (not_lsthan_nor_eq, notisLessThan, isNotEqual);
	 and bltand (blt_true, sigblt, not_lsthan_nor_eq);
	 or orsigbranch (sigbranchIMM, bne_true, blt_true);
	 //wire notsigsetx;
	 //not notsigsetxx (notsigsetx, sigsetx);
	 //and andsigt (sigT, sigJI, notsigsetx);
	 wire sigbex_true;
	 and andsigbextrue (sigbex_true, isNotEqual, sigbex);
	 or orsigt (sigT, sigj, sigjal, sigbex_true);
	 
	 // connecting the regfile
	 // _beforeV means before checking V Flag
	 assign ctrl_readRegA = sigbex? 5'b00000 : rs;
	 wire sw_bne_blt_jr;
	 or orswbnebltjr (sw_bne_blt_jr, sigsw, sigbne, sigblt, sigjr);
	 assign ctrl_readRegB = sigbex ? 5'b11110 : (sw_bne_blt_jr ? rd : rt);
	 assign ctrl_writeReg_beforeV = sigjal ? 5'b11111 : (sigsetx ? 5'b11110 : rd);
	 
	 // connecting the ALU
	 // module seventeen_SX(IMM, IMM_signed);
	 // module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);
	 wire [31:0] IMM_signed, ALU_in_B_data;
	 seventeen_SX mySX (IMM, IMM_signed);
	 assign ALU_in_B_data = ALUinB ? IMM_signed : data_readRegB;
	 wire [31:0] data_result;
	 wire isNotEqual, isLessThan, overflow;
	 alu myalu (data_readRegA, ALU_in_B_data, ALUOPcode, shamt, data_result, isNotEqual, isLessThan, overflow);
	 
	 // connecting the dmem
	 assign data = data_readRegB;
	 assign address_dmem = data_result[11:0];
	 
	 // connecting components for PC5
	 // 12-bit CLA adder
	 // module cla_twelve (A, B, S);
	 wire [11:0] PC_branchIMM, PC_notJI, PC_T;
	 cla_twelve mycla_twelve (PC_AddOne, IMM_signed[11:0], PC_branchIMM);
	 assign PC_notJI = sigbranchIMM ? PC_branchIMM : PC_AddOne;
	 assign PC_T = T[11:0];
	 assign PC_input_beforeJR = sigT ? PC_T : PC_notJI;
	 assign PC_input = sigjr ? data_readRegB[11:0] : PC_input_beforeJR;
	 
	 // extra inputs to Regfile
	 wire [31:0] PC_AddOne_extended, T_extended, data_j_writeReg;
	 twelve_SX mytwelve_SX (PC_AddOne, PC_AddOne_extended);
	 twentyseven_SX mytwentyseven_SX (T, T_extended);
	 assign data_j_writeReg = sigjal ? PC_AddOne_extended : T_extended;
	 wire jal_setx;
	 or myorjalsetx (jal_setx, sigjal, sigsetx);
	 assign data_writeReg_beforeV = jal_setx ? data_j_writeReg : RW_data;
	 
	 
	 // connecting data_writeReg from the far right mux
	 // _beforeV means before checking V Flag
	 assign RW_data = RWd ? q_dmem : data_result;
	 
	 // setting $rstatus
	 // V_n_add means "V Flag and add operation"
	 wire V_n_add, V_n_addi, V_n_sub;
	 and myand0 (V_n_add, overflow, sigadd);
	 and myand1 (V_n_addi, overflow, sigaddi);
	 and myand2 (V_n_sub, overflow, sigsub);
	 assign ctrl_writeReg = overflow ? 5'b11110 : ctrl_writeReg_beforeV;
	 assign data_writeReg = V_n_add ? 32'h00000001 :(V_n_addi ? 32'h00000002 :(V_n_sub ? 32'h00000003 : data_writeReg_beforeV));
	 

endmodule
