module counter (
	clk_in,
	clk_out
);
	input  wire clk_in;
	output wire clk_out;
	
	reg [11:0] a;
	
	always@(posedge clk_in)begin
		a <= a+11'b00000000001;
	end
	
	assign clk_out = a[11];
	
endmodule
	