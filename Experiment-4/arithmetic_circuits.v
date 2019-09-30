`timescale 1ns / 1ps

module HA(input x,y,output cout,s);
(* KEEP = "TRUE" *)

assign cout 	= x & y;
assign s 		= (~x&y) | (~y&x);

endmodule


module FA(input x,y,ci,output cout,s);
(* KEEP = "TRUE" *)
wire w1,w2,w3;

HA ha1(x,y,w2,w1);
HA ha2(w1,ci,w3,s);

assign cout 	= w3 | w2;

endmodule

module RCA(x, y , ci ,cout , s);
(* KEEP = "TRUE" *)
input [3:0] x;
input [3:0] y;
input ci;
output cout;
output [3:0]s;

wire w0,w1,w2;

FA fa1(x[0],y[0],ci,w0,s[0]);
FA fa2(x[1],y[1],w0,w1,s[1]);
FA fa3(x[2],y[2],w1,w2,s[2]);
FA fa4(x[3],y[3],w2,cout,s[3]);

endmodule


module CLA(x, y , ci ,cout , s);
(* KEEP = "TRUE" *)
input [3:0] x;
input [3:0] y;
input ci;
output cout;
output [3:0]s;

wire c0,c1,c2,c3,c4;

assign c0 = ci;
wire [3:0] p;
wire [3:0] g;

assign p = x|y;
assign g = x&y;


assign c1=g[0] | (p[0]& c0);
assign c2=g[1] | (p[1]& c1);
assign c3=g[2] | (p[2]& c2);
assign c4=g[3] | (p[3]& c3);

assign s[0] = c0^x[0]^y[0];
assign s[1] = c1^x[1]^y[1];
assign s[2] = c2^x[2]^y[2];
assign s[3] = c3^x[3]^y[3];
assign cout = c4;

endmodule


module SRCA(x, y , ci ,cout , s, ov);
(* KEEP = "TRUE" *)
input [3:0] x;
input [3:0] y;
input ci;
output cout,ov;
output [3:0]s;


wire w0,w1,w2;

FA fa1(x[0],y[0],ci,w0,s[0]);
FA fa2(x[1],y[1],w0,w1,s[1]);
FA fa3(x[2],y[2],w1,w2,s[2]);
FA fa4(x[3],y[3],w2,cout,s[3]);

assign ov =  w2^cout;

endmodule
 






