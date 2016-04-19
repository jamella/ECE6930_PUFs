`timescale 1ns / 1ps

module DAPUF(challenge, exciteL, exciteR, response);

	//input [63:0] challenge;
	input [39:0] challenge;
	
	input exciteL, exciteR;
	output reg response;

	wire [1:0] r0_s0_res;
	wire [1:0] r0_s1_res;
	wire [1:0] r0_s2_res;
	
	wire r0_a0_out, r0_a1_out, r0_a2_out, r0_a3_out, r0_a4_out, r0_a5_out;
	
	(* KEEP = "TRUE" *) SELECTOR_CHAIN r0_s0(exciteL, exciteR, challenge, r0_s0_res[1], r0_s0_res[0]);
	(* KEEP = "TRUE" *) SELECTOR_CHAIN r0_s1(exciteL, exciteR, challenge, r0_s1_res[1], r0_s1_res[0]);
	(* KEEP = "TRUE" *) SELECTOR_CHAIN r0_s2(exciteL, exciteR, challenge, r0_s2_res[1], r0_s2_res[0]);
	
	(* KEEP = "TRUE" *) arbiter r0_a0(r0_s0_res[1], r0_s1_res[1], r0_a0_out);
	(* KEEP = "TRUE" *) arbiter r0_a1(r0_s0_res[1], r0_s2_res[1], r0_a1_out);
	(* KEEP = "TRUE" *) arbiter r0_a2(r0_s1_res[1], r0_s2_res[1], r0_a2_out);
	(* KEEP = "TRUE" *) arbiter r0_a3(r0_s0_res[0], r0_s1_res[0], r0_a3_out);
	(* KEEP = "TRUE" *) arbiter r0_a4(r0_s0_res[0], r0_s2_res[0], r0_a4_out);
	(* KEEP = "TRUE" *) arbiter r0_a5(r0_s1_res[0], r0_s2_res[0], r0_a5_out);
	
	always@(r0_a0_out or r0_a1_out or r0_a2_out or r0_a3_out or r0_a4_out or r0_a5_out) begin
		response = (r0_a0_out ^ r0_a1_out ^ r0_a2_out ^ r0_a3_out ^ r0_a4_out ^ r0_a5_out);
	end
	
endmodule

module MUX(input A, input B, input C, output Y);
	//assign Y = (A & C) | (B & ~C);
	wire acOut, cNot, cNotbOut;
	
	(* KEEP = "TRUE" *) and(acOut,A,C);
	(* KEEP = "TRUE" *) not(cNot,C);
	(* KEEP = "TRUE" *) and(cNotbOut,B,cNot);
	
	(* KEEP = "TRUE" *) or(Y,acOut,cNotbOut);
	
endmodule

module SELECTOR_CHAIN(signal_L, signal_R, challenge, preresponseL, preresponseR);
    input wire signal_R;
	 input wire signal_L;
	 
    //input wire [63:0] challenge;
	 input wire [39:0] challenge;
	 
    output preresponseL, preresponseR;

    wire [1:0] result0;
    wire [1:0] result1;
    wire [1:0] result2;
    wire [1:0] result3;
    wire [1:0] result4;
    wire [1:0] result5;
    wire [1:0] result6;
    wire [1:0] result7;

    wire [1:0] result8;
    wire [1:0] result9;
    wire [1:0] result10;
    wire [1:0] result11;
    wire [1:0] result12;
    wire [1:0] result13;
    wire [1:0] result14;
    wire [1:0] result15;


    wire [1:0] result16;
    wire [1:0] result17;
    wire [1:0] result18;
    wire [1:0] result19;
    wire [1:0] result20;
    wire [1:0] result21;
    wire [1:0] result22;
    wire [1:0] result23;

    wire [1:0] result24;
    wire [1:0] result25;
    wire [1:0] result26;
    wire [1:0] result27;
    wire [1:0] result28;
    wire [1:0] result29;
    wire [1:0] result30;
	 wire [1:0] result31;


    wire [1:0] result32;
    wire [1:0] result33;
    wire [1:0] result34;
    wire [1:0] result35;
    wire [1:0] result36;
    wire [1:0] result37;
    wire [1:0] result38;
//    wire [1:0] result39;
/*
    wire [1:0] result40;
    wire [1:0] result41;
    wire [1:0] result42;
    wire [1:0] result43;
    wire [1:0] result44;
    wire [1:0] result45;
    wire [1:0] result46;
    wire [1:0] result47;

    wire [1:0] result48;
    wire [1:0] result49;
    wire [1:0] result50;
    wire [1:0] result51;
    wire [1:0] result52;
    wire [1:0] result53;
    wire [1:0] result54;
    wire [1:0] result55;

    wire [1:0] result56;
    wire [1:0] result57;
    wire [1:0] result58;
    wire [1:0] result59;
    wire [1:0] result60;
    wire [1:0] result61;
    wire [1:0] result62;
    //wire [1:0] result63;

*/
    
    (* KEEP = "TRUE" *) MUX mux0_0(signal_R, signal_L, challenge[0], result0[0]);
    (* KEEP = "TRUE" *) MUX mux0_1(signal_L, signal_R, challenge[0], result0[1]);
    (* KEEP = "TRUE" *) MUX mux1_0(result0[1], result0[0], challenge[1], result1[0]);
    (* KEEP = "TRUE" *) MUX mux1_1(result0[0], result0[1], challenge[1], result1[1]);
    (* KEEP = "TRUE" *) MUX mux2_0(result1[1], result1[0], challenge[2], result2[0]);
    (* KEEP = "TRUE" *) MUX mux2_1(result1[0], result1[1], challenge[2], result2[1]);
    (* KEEP = "TRUE" *) MUX mux3_0(result2[1], result2[0], challenge[3], result3[0]);
    (* KEEP = "TRUE" *) MUX mux3_1(result2[0], result2[1], challenge[3], result3[1]);
    (* KEEP = "TRUE" *) MUX mux4_0(result3[1], result3[0], challenge[4], result4[0]);
    (* KEEP = "TRUE" *) MUX mux4_1(result3[0], result3[1], challenge[4], result4[1]);
    (* KEEP = "TRUE" *) MUX mux5_0(result4[1], result4[0], challenge[5], result5[0]);
    (* KEEP = "TRUE" *) MUX mux5_1(result4[0], result4[1], challenge[5], result5[1]);
    (* KEEP = "TRUE" *) MUX mux6_0(result5[1], result5[0], challenge[6], result6[0]);
    (* KEEP = "TRUE" *) MUX mux6_1(result5[0], result5[1], challenge[6], result6[1]);
    (* KEEP = "TRUE" *) MUX mux7_0(result6[1], result6[0], challenge[7], result7[0]);
    (* KEEP = "TRUE" *) MUX mux7_1(result6[0], result6[1], challenge[7], result7[1]);

    (* KEEP = "TRUE" *) MUX mux8_0(result7[1], result7[0], challenge[8], result8[0]);
    (* KEEP = "TRUE" *) MUX mux8_1(result7[0], result7[1], challenge[8], result8[1]);
    (* KEEP = "TRUE" *) MUX mux9_0(result8[1], result8[0], challenge[9], result9[0]);
    (* KEEP = "TRUE" *) MUX mux9_1(result8[0], result8[1], challenge[9], result9[1]);
    (* KEEP = "TRUE" *) MUX mux10_0(result9[1], result9[0], challenge[10], result10[0]);
    (* KEEP = "TRUE" *) MUX mux10_1(result9[0], result9[1], challenge[10], result10[1]);
    (* KEEP = "TRUE" *) MUX mux11_0(result10[1], result10[0], challenge[11], result11[0]);
    (* KEEP = "TRUE" *) MUX mux11_1(result10[0], result10[1], challenge[11], result11[1]);
    (* KEEP = "TRUE" *) MUX mux12_0(result11[1], result11[0], challenge[12], result12[0]);
    (* KEEP = "TRUE" *) MUX mux12_1(result11[0], result11[1], challenge[12], result12[1]);
    (* KEEP = "TRUE" *) MUX mux13_0(result12[1], result12[0], challenge[13], result13[0]);
    (* KEEP = "TRUE" *) MUX mux13_1(result12[0], result12[1], challenge[13], result13[1]);
    (* KEEP = "TRUE" *) MUX mux14_0(result13[1], result13[0], challenge[14], result14[0]);
    (* KEEP = "TRUE" *) MUX mux14_1(result13[0], result13[1], challenge[14], result14[1]);
    (* KEEP = "TRUE" *) MUX mux15_0(result14[1], result14[0], challenge[15], result15[0]);
    (* KEEP = "TRUE" *) MUX mux15_1(result14[0], result14[1], challenge[15], result15[1]);
	 

            
    (* KEEP = "TRUE" *) MUX mux16_0(result15[1], result15[0], challenge[16], result16[0]);
    (* KEEP = "TRUE" *) MUX mux16_1(result15[0], result15[1], challenge[16], result16[1]);
    (* KEEP = "TRUE" *) MUX mux17_0(result16[1], result16[0], challenge[17], result17[0]);
    (* KEEP = "TRUE" *) MUX mux17_1(result16[0], result16[1], challenge[17], result17[1]);
    (* KEEP = "TRUE" *) MUX mux18_0(result17[1], result17[0], challenge[18], result18[0]);
    (* KEEP = "TRUE" *) MUX mux18_1(result17[0], result17[1], challenge[18], result18[1]);
    (* KEEP = "TRUE" *) MUX mux19_0(result18[1], result18[0], challenge[19], result19[0]);
    (* KEEP = "TRUE" *) MUX mux19_1(result18[0], result18[1], challenge[19], result19[1]);
    (* KEEP = "TRUE" *) MUX mux20_0(result19[1], result19[0], challenge[20], result20[0]);
    (* KEEP = "TRUE" *) MUX mux20_1(result19[0], result19[1], challenge[20], result20[1]);
    (* KEEP = "TRUE" *) MUX mux21_0(result20[1], result20[0], challenge[21], result21[0]);
    (* KEEP = "TRUE" *) MUX mux21_1(result20[0], result20[1], challenge[21], result21[1]);
    (* KEEP = "TRUE" *) MUX mux22_0(result21[1], result21[0], challenge[22], result22[0]);
    (* KEEP = "TRUE" *) MUX mux22_1(result21[0], result21[1], challenge[22], result22[1]);
    (* KEEP = "TRUE" *) MUX mux23_0(result22[1], result22[0], challenge[23], result23[0]);
    (* KEEP = "TRUE" *) MUX mux23_1(result22[0], result22[1], challenge[23], result23[1]);
            
    (* KEEP = "TRUE" *) MUX mux24_0(result23[1], result23[0], challenge[24], result24[0]);
    (* KEEP = "TRUE" *) MUX mux24_1(result23[0], result23[1], challenge[24], result24[1]);
    (* KEEP = "TRUE" *) MUX mux25_0(result24[1], result24[0], challenge[25], result25[0]);
    (* KEEP = "TRUE" *) MUX mux25_1(result24[0], result24[1], challenge[25], result25[1]);
    (* KEEP = "TRUE" *) MUX mux26_0(result25[1], result25[0], challenge[26], result26[0]);
    (* KEEP = "TRUE" *) MUX mux26_1(result25[0], result25[1], challenge[26], result26[1]);
    (* KEEP = "TRUE" *) MUX mux27_0(result26[1], result26[0], challenge[27], result27[0]);
    (* KEEP = "TRUE" *) MUX mux27_1(result26[0], result26[1], challenge[27], result27[1]);
    (* KEEP = "TRUE" *) MUX mux28_0(result27[1], result27[0], challenge[28], result28[0]);
    (* KEEP = "TRUE" *) MUX mux28_1(result27[0], result27[1], challenge[28], result28[1]);
    (* KEEP = "TRUE" *) MUX mux29_0(result28[1], result28[0], challenge[29], result29[0]);
    (* KEEP = "TRUE" *) MUX mux29_1(result28[0], result28[1], challenge[29], result29[1]);
    (* KEEP = "TRUE" *) MUX mux30_0(result29[1], result29[0], challenge[30], result30[0]);
    (* KEEP = "TRUE" *) MUX mux30_1(result29[0], result29[1], challenge[30], result30[1]);
    (* KEEP = "TRUE" *) MUX mux31_0(result30[1], result30[0], challenge[31], result31[0]);
    (* KEEP = "TRUE" *) MUX mux31_1(result30[0], result30[1], challenge[31], result31[1]);
 

    (* KEEP = "TRUE" *) MUX mux32_0(result31[1], result31[0], challenge[32], result32[0]);
    (* KEEP = "TRUE" *) MUX mux32_1(result31[0], result31[1], challenge[32], result32[1]);
    (* KEEP = "TRUE" *) MUX mux33_0(result32[1], result32[0], challenge[33], result33[0]);
    (* KEEP = "TRUE" *) MUX mux33_1(result32[0], result32[1], challenge[33], result33[1]);
    (* KEEP = "TRUE" *) MUX mux34_0(result33[1], result33[0], challenge[34], result34[0]);
    (* KEEP = "TRUE" *) MUX mux34_1(result33[0], result33[1], challenge[34], result34[1]);
    (* KEEP = "TRUE" *) MUX mux35_0(result34[1], result34[0], challenge[35], result35[0]);
    (* KEEP = "TRUE" *) MUX mux35_1(result34[0], result34[1], challenge[35], result35[1]);
    (* KEEP = "TRUE" *) MUX mux36_0(result35[1], result35[0], challenge[36], result36[0]);
    (* KEEP = "TRUE" *) MUX mux36_1(result35[0], result35[1], challenge[36], result36[1]);
    (* KEEP = "TRUE" *) MUX mux37_0(result36[1], result36[0], challenge[37], result37[0]);
    (* KEEP = "TRUE" *) MUX mux37_1(result36[0], result36[1], challenge[37], result37[1]);
    (* KEEP = "TRUE" *) MUX mux38_0(result37[1], result37[0], challenge[38], result38[0]);
    (* KEEP = "TRUE" *) MUX mux38_1(result37[0], result37[1], challenge[38], result38[1]);
    //(* KEEP = "TRUE" *) MUX mux39_0(result38[1], result38[0], challenge[39], result39[0]);
    //(* KEEP = "TRUE" *) MUX mux39_1(result38[0], result38[1], challenge[39], result39[1]);
	 (* KEEP = "TRUE" *) MUX mux39_0(result38[1], result38[0], challenge[39], preresponseR);
    (* KEEP = "TRUE" *) MUX mux39_1(result38[0], result38[1], challenge[39], preresponseL);

/*            
    (* KEEP = "TRUE" *) MUX mux40_0(result39[1], result39[0], challenge[40], result40[0]);
    (* KEEP = "TRUE" *) MUX mux40_1(result39[0], result39[1], challenge[40], result40[1]);
    (* KEEP = "TRUE" *) MUX mux41_0(result40[1], result40[0], challenge[41], result41[0]);
    (* KEEP = "TRUE" *) MUX mux41_1(result40[0], result40[1], challenge[41], result41[1]);
    (* KEEP = "TRUE" *) MUX mux42_0(result41[1], result41[0], challenge[42], result42[0]);
    (* KEEP = "TRUE" *) MUX mux42_1(result41[0], result41[1], challenge[42], result42[1]);
    (* KEEP = "TRUE" *) MUX mux43_0(result42[1], result42[0], challenge[43], result43[0]);
    (* KEEP = "TRUE" *) MUX mux43_1(result42[0], result42[1], challenge[43], result43[1]);
    (* KEEP = "TRUE" *) MUX mux44_0(result43[1], result43[0], challenge[44], result44[0]);
    (* KEEP = "TRUE" *) MUX mux44_1(result43[0], result43[1], challenge[44], result44[1]);
    (* KEEP = "TRUE" *) MUX mux45_0(result44[1], result44[0], challenge[45], result45[0]);
    (* KEEP = "TRUE" *) MUX mux45_1(result44[0], result44[1], challenge[45], result45[1]);
    (* KEEP = "TRUE" *) MUX mux46_0(result45[1], result45[0], challenge[46], result46[0]);
    (* KEEP = "TRUE" *) MUX mux46_1(result45[0], result45[1], challenge[46], result46[1]);
    (* KEEP = "TRUE" *) MUX mux47_0(result46[1], result46[0], challenge[47], result47[0]);
    (* KEEP = "TRUE" *) MUX mux47_1(result46[0], result46[1], challenge[47], result47[1]);
            
    (* KEEP = "TRUE" *) MUX mux48_0(result47[1], result47[0], challenge[48], result48[0]);
    (* KEEP = "TRUE" *) MUX mux48_1(result47[0], result47[1], challenge[48], result48[1]);
    (* KEEP = "TRUE" *) MUX mux49_0(result48[1], result48[0], challenge[49], result49[0]);
    (* KEEP = "TRUE" *) MUX mux49_1(result48[0], result48[1], challenge[49], result49[1]);
    (* KEEP = "TRUE" *) MUX mux50_0(result49[1], result49[0], challenge[50], result50[0]);
    (* KEEP = "TRUE" *) MUX mux50_1(result49[0], result49[1], challenge[50], result50[1]);
    (* KEEP = "TRUE" *) MUX mux51_0(result50[1], result50[0], challenge[51], result51[0]);
    (* KEEP = "TRUE" *) MUX mux51_1(result50[0], result50[1], challenge[51], result51[1]);
    (* KEEP = "TRUE" *) MUX mux52_0(result51[1], result51[0], challenge[52], result52[0]);
    (* KEEP = "TRUE" *) MUX mux52_1(result51[0], result51[1], challenge[52], result52[1]);
    (* KEEP = "TRUE" *) MUX mux53_0(result52[1], result52[0], challenge[53], result53[0]);
    (* KEEP = "TRUE" *) MUX mux53_1(result52[0], result52[1], challenge[53], result53[1]);
    (* KEEP = "TRUE" *) MUX mux54_0(result53[1], result53[0], challenge[54], result54[0]);
    (* KEEP = "TRUE" *) MUX mux54_1(result53[0], result53[1], challenge[54], result54[1]);
    (* KEEP = "TRUE" *) MUX mux55_0(result54[1], result54[0], challenge[55], result55[0]);
    (* KEEP = "TRUE" *) MUX mux55_1(result54[0], result54[1], challenge[55], result55[1]);
            
    (* KEEP = "TRUE" *) MUX mux56_0(result55[1], result55[0], challenge[56], result56[0]);
    (* KEEP = "TRUE" *) MUX mux56_1(result55[0], result55[1], challenge[56], result56[1]);
    (* KEEP = "TRUE" *) MUX mux57_0(result56[1], result56[0], challenge[57], result57[0]);
    (* KEEP = "TRUE" *) MUX mux57_1(result56[0], result56[1], challenge[57], result57[1]);
    (* KEEP = "TRUE" *) MUX mux58_0(result57[1], result57[0], challenge[58], result58[0]);
    (* KEEP = "TRUE" *) MUX mux58_1(result57[0], result57[1], challenge[58], result58[1]);
    (* KEEP = "TRUE" *) MUX mux59_0(result58[1], result58[0], challenge[59], result59[0]);
    (* KEEP = "TRUE" *) MUX mux59_1(result58[0], result58[1], challenge[59], result59[1]);
    (* KEEP = "TRUE" *) MUX mux60_0(result59[1], result59[0], challenge[60], result60[0]);
    (* KEEP = "TRUE" *) MUX mux60_1(result59[0], result59[1], challenge[60], result60[1]);
    (* KEEP = "TRUE" *) MUX mux61_0(result60[1], result60[0], challenge[61], result61[0]);
    (* KEEP = "TRUE" *) MUX mux61_1(result60[0], result60[1], challenge[61], result61[1]);
    (* KEEP = "TRUE" *) MUX mux62_0(result61[1], result61[0], challenge[62], result62[0]);
    (* KEEP = "TRUE" *) MUX mux62_1(result61[0], result61[1], challenge[62], result62[1]);
    (* KEEP = "TRUE" *) MUX mux63_0(result62[1], result62[0], challenge[63], preresponseR);
    (* KEEP = "TRUE" *) MUX mux63_1(result62[0], result62[1], challenge[63], preresponseL);

*/

endmodule

module arbiter(clk, D, Q);
	input clk;
	input D;
	output Q;
	
	wire Qbar, n1_out, n2_out, n3_out, n4_out;
	
	assign n1_out = ~(n4_out & n2_out);
	assign n2_out = ~(n1_out & clk);
	assign n3_out = ~(clk & n4_out);
	assign n4_out = ~(n3_out & D);
	
	assign Q = ~(n2_out & Qbar);
	assign Qbar = ~(Q & n3_out);
	
endmodule 