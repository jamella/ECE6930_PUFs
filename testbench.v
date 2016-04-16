`timescale 1ns / 1ps

module testbench();

	reg clk;
	reg r1;
	
	reg exciteL, exciteR;
	reg [4:0] iter;
	reg [4:0] iterNext;

	parameter [63:0] challenge = 64'h05050F0F05050F0F;
	
	initial begin
		clk = 0;
		iter = 0;
		iterNext = 0;
		exciteL = 0;
		exciteR = 0;
	end
	
	always
	begin
		#10 clk = !clk;
	end
	
	always @(*) begin
		iterNext = iter + 1;
		
		if (iter == 10)
			exciteL = 1;
			
		if (iter == 10)
			exciteR = 1;
	end
	
	always @(posedge clk)
	begin
		iter = iterNext;
	end
	
	DAPUF p1(clk, challenge, exciteL, exciteR, r1);	

endmodule
