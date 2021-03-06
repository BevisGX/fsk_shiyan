
module ENCODER(IN1,IN2,IN3,IN4,clk,reset,OUT);
	input IN1,IN2,IN3,IN4,clk,reset;
	output reg OUT;
	reg [2:0] cnt;
	reg in1,in2,in3,in4;
	initial begin
	  cnt = 3'b000;
	  end
	always @(posedge clk )begin

		  if(cnt == 3'b000)begin
			   in1 <= IN1;
			   in2 <= IN2;
			   in3 <= IN3;
			   in4 <= IN4;
			   OUT <= 0;
			end
		  if(cnt == 3'b001)begin
			   OUT <= 1;
			end
			if(cnt == 3'b010)begin
			   OUT <= 0;
			end
			if(cnt == 3'b011)begin
			   OUT <= in1;
			end
			if(cnt == 3'b100)begin
			   OUT <= in2;
			end
			if(cnt == 3'b101)begin
			   OUT <= in3;
			end
			if(cnt == 3'b110)begin
			   OUT <= in4;
			end
			if(cnt == 3'b111)begin
			   OUT <= in1 + in2 + in3 + in4 ;
			end
			cnt<=cnt+3'b001;
  end
endmodule


	
