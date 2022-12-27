/**
 * NOTE: you should not need to change this file! This file will be swapped out for a grading
 * "skeleton" for testing. We will also remove your imem and dmem file.
 *
 * NOTE: skeleton should be your top-level module!
 *
 * This skeleton file serves as a wrapper around the processor to provide certain control signals
 * and interfaces to memory elements. This structure allows for easier testing, as it is easier to
 * inspect which signals the processor tries to assert when.
 */

module tst_skeleton(clock, reset, imem_clock, dmem_clock, processor_clock, regfile_clock,addr_imem,addr_dmem,out_imem, out_dmem, in_dmem, w_reg, r_regA,r_regB,ctl_wr, ctl_a, ctl_b,dmem_en, reg_en);
    input clock, reset;
    /* 
        Create four clocks for each module from the original input "clock".
        These four outputs will be used to run the clocked elements of your processor on the grading side. 
        You should output the clocks you have decided to use for the imem, dmem, regfile, and processor 
        (these may be inverted, divided, or unchanged from the original clock input). Your grade will be 
        based on proper functioning with this clock.
    */
    output imem_clock, dmem_clock, processor_clock, regfile_clock;
	
	output [11:0] addr_imem,addr_dmem;
	output [31:0] out_imem, out_dmem, in_dmem, w_reg, r_regA,r_regB;
	output [4:0] ctl_wr, ctl_a, ctl_b;
	output dmem_en, reg_en;
	
	
	assign addr_imem=address_imem;
	assign addr_dmem=address_dmem;
	assign out_imem=q_imem;
	assign out_dmem=q_dmem;
	assign in_dmem=data;
	assign w_reg=data_writeReg;
	assign r_regA=data_readRegA;
	assign r_regB=data_readRegB;
	assign ctl_wr=ctrl_writeReg;
	assign ctl_a=ctrl_readRegA;
	assign ctl_b=ctrl_readRegB;
	assign dmem_en=wren;
	assign reg_en=ctrl_writeEnable;
	 /** CLK STUFF **/
	 wire clk_four, clk_four_n;
	 clk_div_four myclk_div_four (clk_four, clock, reset);
	 not notclk (clk_four_n, clk_four);
	 
	 assign imem_clock = clock;
	 assign dmem_clock = clock;
	 assign processor_clock = clk_four_n;
	 assign regfile_clock = clk_four_n;

    /** IMEM **/
    // Figure out how to generate a Quartus syncram component and commit the generated verilog file.
    // Make sure you configure it correctly!
    wire [11:0] address_imem;
    wire [31:0] q_imem;
    imem my_imem(
        .address    (address_imem),            // address of data
        .clock      (imem_clock),                  // you may need to invert the clock
        .q          (q_imem)                   // the raw instruction
    );
	 /*imem_v my_imem(
        .address    (address_imem),            // address of data
        .clock      (imem_clock),                  // you may need to invert the clock
        .q          (q_imem)                   // the raw instruction
    );*/

    /** DMEM **/
    // Figure out how to generate a Quartus syncram component and commit the generated verilog file.
    // Make sure you configure it correctly!
    wire [11:0] address_dmem;
    wire [31:0] data;
    wire wren;
    wire [31:0] q_dmem;
    dmem my_dmem(
        .address    (address_dmem),       // address of data
        .clock      (dmem_clock),                  // may need to invert the clock
        .data	    (data),    // data you want to write
        .wren	    (wren),      // write enable
        .q          (q_dmem)    // data from dmem
    );

    /** REGFILE **/
    // Instantiate your regfile
    wire ctrl_writeEnable;
    wire [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
    wire [31:0] data_writeReg;
    wire [31:0] data_readRegA, data_readRegB;
    regfile my_regfile(
        regfile_clock,
        ctrl_writeEnable,
        reset,
        ctrl_writeReg,
        ctrl_readRegA,
        ctrl_readRegB,
        data_writeReg,
        data_readRegA,
        data_readRegB
    );

    /** PROCESSOR **/
    processor my_processor(
        // Control signals
        processor_clock,                          // I: The master clock
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
    );

endmodule
