`timescale 1ns / 1ps

module keyGen(Clk, L0,L1,L2,L3,L4,L5,L6,L7);

	input Clk;
	
	output reg L0,L1,L2,L3,L4,L5,L6,L7;
	
	wire r0,r1,r2,r3,r4,r5,r6,r7;
	
	reg exciteL, exciteR;
	reg [6:0] iter;
	reg [6:0] iterNext;

	//parameter [63:0] challenge = 64'h05050F0F05050F0F;
	//parameter [63:0] challenge = 64'hFFFFFFFFFFFFFFFF;
	//parameter [63:0] challenge = 64'hDEADBEEF0000FFFF;
	parameter [63:0] challenge = 64'h05055F5F55252F2F;
	
	initial begin
		iter = 0;
		iterNext = 0;
		exciteL = 0;
		exciteR = 0;
	end
	
	always @(*) begin
		iterNext = iter + 1;
		
		if (iter == 100)
			exciteL = 1;
		else
			exciteL = 0;
			
		if (iter == 100)
			exciteR = 1;
		else
			exciteR = 0;
			
	end
	
	always @(posedge Clk)
	begin
		iter = iterNext;
	end
	
	(* KEEP = "TRUE"*) DAPUF p0(Clk, challenge, exciteL, exciteR, r0);
	(* KEEP = "TRUE"*) DAPUF p1(Clk, challenge, exciteL, exciteR, r1);
	(* KEEP = "TRUE"*) DAPUF p2(Clk, challenge, exciteL, exciteR, r2);
	(* KEEP = "TRUE"*) DAPUF p3(Clk, challenge, exciteL, exciteR, r3);
	
	(* KEEP = "TRUE"*) DAPUF p4(Clk, challenge, exciteL, exciteR, r4);
	(* KEEP = "TRUE"*) DAPUF p5(Clk, challenge, exciteL, exciteR, r5);
	(* KEEP = "TRUE"*) DAPUF p6(Clk, challenge, exciteL, exciteR, r6);
	(* KEEP = "TRUE"*) DAPUF p7(Clk, challenge, exciteL, exciteR, r7);


	always @(posedge Clk)
	begin
		L0 = r0;
		L1 = r1;
		L2 = r2;
		L3 = r3;
		
		L4 = r4;
		L5 = r5;
		L6 = r6;
		L7 = r7;
	end
	
endmodule
