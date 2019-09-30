`timescale 1ns / 1ps
module ring_oscillator (input A, output C);
(* KEEP = "TRUE" *)
wire [199:0] W;
genvar i;
	generate
	for (i =0; i < 199; i = i + 1)
		begin:dfsf
		NOT NOT0(W[i],W[i+1]);
		end
	endgenerate
TRI TRI0 (W[199],A,W[0]);
assign C = W[10];
endmodule
