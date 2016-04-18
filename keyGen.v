`timescale 1ns / 1ps

module keyGen(Clk,L0,L1,L2,L3,L4,L5,L6,L7,SW1);

	input Clk, SW1;
	
	output reg L0,L1,L2,L3,L4,L5,L6,L7;
	
	//wire [63:0] r;
	wire [15:0] r;
	
	//reg [63:0] response;
	reg [15:0] response;
	
	reg[8:0] iter, iterNext;
	(* KEEP = "TRUE" *) reg exciteL, exciteR;

	//reg [63:0] challenge;
	reg [15:0] challenge;
	
	initial begin
		iter = 0;
		iterNext = 0;
		exciteL = 1;
		exciteR = 1;
		//challenge = 64'hFFFFFFFFFFFFFFFF;
		challenge = 16'hFFFF;
		
	end
	
	always @(*) begin
		iterNext = iter + 1;
	end
	
	always @(posedge Clk)
	begin
		iter = iterNext;
	end
	
	(* KEEP = "TRUE" *) DAPUF p0(challenge, exciteL, exciteR, r[0]);
	(* KEEP = "TRUE" *) DAPUF p1(challenge, exciteL, exciteR, r[1]);
	(* KEEP = "TRUE" *) DAPUF p2(challenge, exciteL, exciteR, r[2]);
	(* KEEP = "TRUE" *) DAPUF p3(challenge, exciteL, exciteR, r[3]);
	
	(* KEEP = "TRUE" *) DAPUF p4(challenge, exciteL, exciteR, r[4]);
	(* KEEP = "TRUE" *) DAPUF p5(challenge, exciteL, exciteR, r[5]);
	(* KEEP = "TRUE" *) DAPUF p6(challenge, exciteL, exciteR, r[6]);
	(* KEEP = "TRUE" *) DAPUF p7(challenge, exciteL, exciteR, r[7]);
	
	(* KEEP = "TRUE" *) DAPUF p8(challenge, exciteL, exciteR, r[8]);
	(* KEEP = "TRUE" *) DAPUF p9(challenge, exciteL, exciteR, r[9]);
	(* KEEP = "TRUE" *) DAPUF p10(challenge, exciteL, exciteR, r[10]);
	(* KEEP = "TRUE" *) DAPUF p11(challenge, exciteL, exciteR, r[11]);
	
	(* KEEP = "TRUE" *) DAPUF p12(challenge, exciteL, exciteR, r[12]);
	(* KEEP = "TRUE" *) DAPUF p13(challenge, exciteL, exciteR, r[13]);
	(* KEEP = "TRUE" *) DAPUF p14(challenge, exciteL, exciteR, r[14]);
	(* KEEP = "TRUE" *) DAPUF p15(challenge, exciteL, exciteR, r[15]);

/*	
	(* KEEP = "TRUE" *) DAPUF p16(challenge, exciteL, exciteR, r[16]);
	(* KEEP = "TRUE" *) DAPUF p17(challenge, exciteL, exciteR, r[17]);
	(* KEEP = "TRUE" *) DAPUF p18(challenge, exciteL, exciteR, r[18]);
	(* KEEP = "TRUE" *) DAPUF p19(challenge, exciteL, exciteR, r[19]);
	
	(* KEEP = "TRUE" *) DAPUF p20(challenge, exciteL, exciteR, r[20]);
	(* KEEP = "TRUE" *) DAPUF p21(challenge, exciteL, exciteR, r[21]);
	(* KEEP = "TRUE" *) DAPUF p22(challenge, exciteL, exciteR, r[22]);
	(* KEEP = "TRUE" *) DAPUF p23(challenge, exciteL, exciteR, r[23]);
	
	(* KEEP = "TRUE" *) DAPUF p24(challenge, exciteL, exciteR, r[24]);
	(* KEEP = "TRUE" *) DAPUF p25(challenge, exciteL, exciteR, r[25]);
	(* KEEP = "TRUE" *) DAPUF p26(challenge, exciteL, exciteR, r[26]);
	(* KEEP = "TRUE" *) DAPUF p27(challenge, exciteL, exciteR, r[27]);
	
	(* KEEP = "TRUE" *) DAPUF p28(challenge, exciteL, exciteR, r[28]);
	(* KEEP = "TRUE" *) DAPUF p29(challenge, exciteL, exciteR, r[29]);
	(* KEEP = "TRUE" *) DAPUF p30(challenge, exciteL, exciteR, r[30]);
	(* KEEP = "TRUE" *) DAPUF p31(challenge, exciteL, exciteR, r[31]);

	
	(* KEEP = "TRUE" *) DAPUF p32(challenge, exciteL, exciteR, r[32]);
	(* KEEP = "TRUE" *) DAPUF p33(challenge, exciteL, exciteR, r[33]);
	(* KEEP = "TRUE" *) DAPUF p34(challenge, exciteL, exciteR, r[34]);
	(* KEEP = "TRUE" *) DAPUF p35(challenge, exciteL, exciteR, r[35]);
	
	(* KEEP = "TRUE" *) DAPUF p36(challenge, exciteL, exciteR, r[36]);
	(* KEEP = "TRUE" *) DAPUF p37(challenge, exciteL, exciteR, r[37]);
	(* KEEP = "TRUE" *) DAPUF p38(challenge, exciteL, exciteR, r[38]);
	(* KEEP = "TRUE" *) DAPUF p39(challenge, exciteL, exciteR, r[39]);
	
	(* KEEP = "TRUE" *) DAPUF p40(challenge, exciteL, exciteR, r[40]);
	(* KEEP = "TRUE" *) DAPUF p41(challenge, exciteL, exciteR, r[41]);
	(* KEEP = "TRUE" *) DAPUF p42(challenge, exciteL, exciteR, r[42]);
	(* KEEP = "TRUE" *) DAPUF p43(challenge, exciteL, exciteR, r[43]);
	
	(* KEEP = "TRUE" *) DAPUF p44(challenge, exciteL, exciteR, r[44]);
	(* KEEP = "TRUE" *) DAPUF p45(challenge, exciteL, exciteR, r[45]);
	(* KEEP = "TRUE" *) DAPUF p46(challenge, exciteL, exciteR, r[46]);
	(* KEEP = "TRUE" *) DAPUF p47(challenge, exciteL, exciteR, r[47]);
	
	(* KEEP = "TRUE" *) DAPUF p48(challenge, exciteL, exciteR, r[48]);
	(* KEEP = "TRUE" *) DAPUF p49(challenge, exciteL, exciteR, r[49]);
	(* KEEP = "TRUE" *) DAPUF p50(challenge, exciteL, exciteR, r[50]);
	(* KEEP = "TRUE" *) DAPUF p51(challenge, exciteL, exciteR, r[51]);
	
	(* KEEP = "TRUE" *) DAPUF p52(challenge, exciteL, exciteR, r[52]);
	(* KEEP = "TRUE" *) DAPUF p53(challenge, exciteL, exciteR, r[53]);
	(* KEEP = "TRUE" *) DAPUF p54(challenge, exciteL, exciteR, r[54]);
	(* KEEP = "TRUE" *) DAPUF p55(challenge, exciteL, exciteR, r[55]);
	
	(* KEEP = "TRUE" *) DAPUF p56(challenge, exciteL, exciteR, r[56]);
	(* KEEP = "TRUE" *) DAPUF p57(challenge, exciteL, exciteR, r[57]);
	(* KEEP = "TRUE" *) DAPUF p58(challenge, exciteL, exciteR, r[58]);
	(* KEEP = "TRUE" *) DAPUF p59(challenge, exciteL, exciteR, r[59]);
	
	(* KEEP = "TRUE" *) DAPUF p60(challenge, exciteL, exciteR, r[60]);
	(* KEEP = "TRUE" *) DAPUF p61(challenge, exciteL, exciteR, r[61]);
	(* KEEP = "TRUE" *) DAPUF p62(challenge, exciteL, exciteR, r[62]);
	(* KEEP = "TRUE" *) DAPUF p63(challenge, exciteL, exciteR, r[63]);
*/

	always @(posedge Clk)
	begin
		if(iter == 1)begin
			exciteL = 0;
			exciteR = 0;
			
			if(SW1 == 1)begin
				//challenge = 64'hAAAAAAAAAAAAAAAA;
				challenge = 16'hAAAA;
			end
			
			if(SW1 == 0)begin
				//challenge = 64'h5555555555555555;
				challenge = 16'h5555;
			end
		end
		
		if(iter == 20)begin
			exciteL = 1;
			exciteR = 1;
		end
		
		if(iter == 50)begin
			L0 = response[0];
			L1 = response[1];
			L2 = response[2];
			L3 = response[3];
			L4 = response[4];
			L5 = response[5];
			L6 = response[6];
			L7 = response[7];
		end
		
		if(iter == 70)begin
			L0 = response[8];
			L1 = response[9];
			L2 = response[10];
			L3 = response[11];
			L4 = response[12];
			L5 = response[13];
			L6 = response[14];
			L7 = response[15];
		end
/*		
		if(iter == 90)begin
			L0 = response[16];
			L1 = response[17];
			L2 = response[18];
			L3 = response[19];
			L4 = response[20];
			L5 = response[21];
			L6 = response[22];
			L7 = response[23];
		end
		
		if(iter == 110)begin
			L0 = response[24];
			L1 = response[25];
			L2 = response[26];
			L3 = response[27];
			L4 = response[28];
			L5 = response[29];
			L6 = response[30];
			L7 = response[31];
		end


		if(iter == 130)begin
			L0 = response[32];
			L1 = response[33];
			L2 = response[34];
			L3 = response[35];
			L4 = response[36];
			L5 = response[37];
			L6 = response[38];
			L7 = response[39];
		end
		
		if(iter == 150)begin
			L0 = response[40];
			L1 = response[41];
			L2 = response[42];
			L3 = response[43];
			L4 = response[44];
			L5 = response[45];
			L6 = response[46];
			L7 = response[47];
		end
		
		if(iter == 170)begin
			L0 = response[48];
			L1 = response[49];
			L2 = response[50];
			L3 = response[51];
			L4 = response[52];
			L5 = response[53];
			L6 = response[54];
			L7 = response[55];
		end
		
		if(iter == 190)begin
			L0 = response[56];
			L1 = response[57];
			L2 = response[58];
			L3 = response[59];
			L4 = response[60];
			L5 = response[61];
			L6 = response[62];
			L7 = response[63];
		end
*/		
	end
	
	always@(*) begin
		response = {r};
	end 
	
endmodule
