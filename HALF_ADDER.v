//////////////////////////////////////ha
module HALF_ADDER(output sum, carry, input a, b); 
 
assign   sum = a ^ b  ; 
assign carry = (a & b); 
						 
endmodule
