//`timescale 1ns/100ps
//exact

module MAC(
	output [16:0] result,
	input [7:0] multiplicand, multiplier,
	input clock, clear
	);
wire [15:0] product;
wire [16:0] temp;
wire [16:0] sum;
reg [16:0] tempSum=17'b0;
reg [1:0] check=2'b0;

Wallace8x8 uut1 (.product(product),.multiplicand(multiplicand),.multiplier(multiplier),.clock(clock),.clear(clear));

cla_adder #(.WIDTH(17)) uut2(.s(sum), .a({1'b0, product}), .b(temp));

always @ (posedge clock, negedge clear)
begin
	if(!clear) 
		tempSum <= 17'b0;
	else begin
		tempSum <= sum;
	end
end

assign result = tempSum;
assign temp = tempSum;

endmodule 
/////////////////////////