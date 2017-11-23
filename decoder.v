
module ENCODER(IN, clk,reset,OUT,WRONG);
	input reset, clk,IN;
	output [3:0]OUT;
	output WRONG;
	reg [2:0] head;
	reg [2:0] head_cnt;
	reg [2:0] head_place;
	reg switch;
	initial begin
		head=3'b000;
		head_cnt=3'b000;
	end
	always @(posedge clk)begin
	 if(!reset)begin
	   
	   end
	 else begin
	  
	   end
	end
	
endmodule
	
