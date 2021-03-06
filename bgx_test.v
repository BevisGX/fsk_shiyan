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

module test_code();
	
	reg reset_ec,reset_dc;
	reg clk_ec,clk_dc;
	reg IN1,IN2,IN3,IN4;
	wire IN_dc,OUT_ec;
	wire [3:0]OUT_dc;
	wire WRONG;
	reg cnt;
	ENCODER ec(IN1,IN2,IN3,IN4,clk_ec,reset_ec,OUT_ec);
	DECODER dc(IN_dc,clk_dc,reset_dc,OUT_dc,WRONG);
	assign IN_dc=OUT_ec;
	initial begin
		reset_ec = 1;
		reset_dc = 1;
		clk_ec = 1;
		clk_dc = 1;
		IN1=1;
		IN2=0;
		IN3=1;
		IN4=1;
		cnt=0;
		#100 reset_ec = 0;
		#500 reset_dc = 0;
		#800
		IN1=0;
		IN2=1;
		IN3=1;
		IN4=1;
	end
	
	always #25 begin
	  cnt=cnt+1;
	  if(cnt)begin
	 clk_ec = ~clk_ec;
	 end
	 else begin
	 clk_dc = ~clk_dc;
	 end
	 end
endmodule

