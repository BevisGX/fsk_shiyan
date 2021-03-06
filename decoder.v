
module DECODER(IN, clk,reset,OUT,WRONG);
	input reset,clk,IN;
	output reg[3:0]OUT;
	output reg WRONG;
	reg [2:0] head;
	reg [2:0] head_cnt;
	reg [2:0] head_place;
	reg switch;
	reg [3:0]outs;
	initial begin
		head=3'b000;
		head_cnt=3'b111;
		head_place=3'b111;
		switch=0;
		outs=4'b0000;
		OUT=4'b0000;
		WRONG=0;
	end
	always @(posedge clk)begin
	 if(!reset)begin
	   head=head<<1;
	   head=head+IN;
	   head_cnt=head_cnt+1;
	   if(!switch)begin
	     if(head==3'b010)begin
	       head_place=head_cnt;
	       switch=1;
	       end
	     end
	    else begin
	      if(head_place==head_cnt & head!=3'b010)begin 
	        switch=0; 
	        end
	        else begin
	          case(head_cnt-head_place)
	            3'b001:outs[0]<=IN;
	            3'b010:outs[1]<=IN;
	            3'b011:outs[2]<=IN;
	            3'b100:outs[3]<=IN;
	            3'b101:WRONG<=outs[0]+outs[1]+outs[2]+outs[3]+IN;
	            default:OUT<=outs;
	            endcase
	          end
	     end
	   end
	 else begin
	  head<=3'b000;
		head_cnt<=3'b111;
		head_place<=3'b111;
		switch<=0;
	   end
	end
	
endmodule
	
