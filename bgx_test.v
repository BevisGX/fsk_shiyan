module test_ec();
	
	reg reset;
	reg clk;
	reg IN;
	DECODER dc(IN,clk,reset,OUT,WRONG);
	
	initial begin
		reset = 1;
		clk = 1;
		IN=1;
		#100 reset = 0;
	end
	
	always #50 clk = ~clk;
		
endmodule
