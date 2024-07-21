/////////////////////////////////////////////////////////
module cla_adder
	#(parameter WIDTH = 8)
	(
	input [WIDTH-1:0] a,
	input [WIDTH-1:0] b,
	output [WIDTH-1:0] s
	);
     
wire [WIDTH:0] C;
wire [WIDTH-1:0] G, P, SUM;
 
// Full adders
genvar k;
generate
	for (k=0; k<WIDTH; k=k+1) begin: label1
	FULL_ADDER fa( 
            .a(a[k]),
            .b(b[k]),
            .cin(C[k]),
            .sum(SUM[k]),
            .carry()
        );
    end
endgenerate

assign C[0] = 1'b0;

// Carry terms:
genvar n;
generate
	for (n=0; n<WIDTH; n=n+1) begin: label2
		assign G[n] = a[n] & b[n];
		assign P[n] = a[n] | b[n];
		assign C[n+1] = G[n] | (P[n] & C[n]);
    end
endgenerate

assign s = SUM;
 
endmodule // carry_lookahead_adder
