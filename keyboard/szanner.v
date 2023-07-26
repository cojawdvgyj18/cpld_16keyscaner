module scanner (
	input  wire clk,
	input  wire [3:0] key_col,
	output reg  [3:0] key_row,
	output reg  [3:0] data_out
);
	reg [1:0] counter;
	always@(posedge clk) begin
		counter<=counter+2'B01;
		end
	always@(negedge clk) begin
		if (key_col != 4'b1111) begin
			case (key_col)
				4'b0111 : data_out[1:0] <= 2'b00;
				4'b1011 : data_out[1:0] <= 2'b01;
				4'b1101 : data_out[1:0] <= 2'b10;
				4'b1110 : data_out[1:0] <= 2'b11;
				default : data_out[1:0] <= 2'bxx;
				endcase
			data_out[3:2] <= counter;
			end
		end
	always@(*)begin
		case (counter)
			2'b00 : key_row <= 4'b1000;
			2'b01 : key_row <= 4'b0100;
			2'b10 : key_row <= 4'b0010;
			2'b11 : key_row <= 4'b0001;
			endcase
		end
	endmodule
		