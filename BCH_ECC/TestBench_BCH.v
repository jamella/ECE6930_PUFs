`timescale 1ns / 1ps
// This is a test for the BCH error correction

module TestBench_BCH();
    
    reg [31:0] pufRes;
	 reg [31:0] pufRes2;
    //parameter [31:0] input_response2 = '32h013346;
	 
	 reg [31:0] response;
	 
    wire [11:0] parity;
	 
    wire [31:0] mask;
    wire error;
	 
	 reg [11:0] parity_reg;
	 reg [31:0] mask_reg;
	 reg error_reg;

	 initial begin
		pufRes = 32'h013346;
		pufRes2 = 32'h001346;
		response = 0;
		parity_reg = 0;
		mask_reg = 0;
		error_reg = 0;
	 end

    bch_dec_enc_univ_top encode(pufRes, parity);

    bch_dec_dcd_univ_top decode(pufRes2, parity, mask, error);

    always@(*)begin
		parity_reg = parity;
		mask_reg = mask;
		error_reg = error;
		response = mask ^ pufRes2;
	 end

endmodule
