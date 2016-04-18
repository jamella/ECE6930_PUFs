`timescale 1ns / 1ps
// This is a test for the BCH error correction

module TestBench_BCH(
    input wire clk
    );
    
    localparam input_response = '48h012345;
    localparam input_response2 = '48h013346;

    reg [63:0] parity;
    reg [63:0] mask;
    reg error;

    reg [63:0] response;

    bch_dec_enc_univ_top(input_response, parity);

    bch_dec_dcd_univ_top(input_response2, parity, mask, error);

    response = mask^input_response2;

endmodule
