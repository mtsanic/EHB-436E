`timescale 1ns / 1ps
module DECODER(input [3:0]IN, output reg [15:0]OUT);
always @(*)
begin
case(IN)
4'b0000 : OUT=16'b0000000000000001;
4'b0001 : OUT=16'b0000000000000010;
4'b0010 : OUT=16'b0000000000000100;
4'b0011 : OUT=16'b0000000000001000;
4'b0100 : OUT=16'b0000000000010000;
4'b0101 : OUT=16'b0000000000100000;
4'b0110 : OUT=16'b0000000001000000;
4'b0111 : OUT=16'b0000000010000000;
4'b1000 : OUT=16'b0000000100000000;
4'b1001 : OUT=16'b0000001000000000;
4'b1010 : OUT=16'b0000010000000000;
4'b1011 : OUT=16'b0000100000000000;
4'b1100 : OUT=16'b0001000000000000;
4'b1101 : OUT=16'b0010000000000000;
4'b1110 : OUT=16'b0100000000000000;
4'b1111 : OUT=16'b1000000000000000;
endcase
end
endmodule


module ENCODER(IN, E,OUT);
input [3:0]IN;
output [1:0]OUT;
output E;


reg[1:0]OUT;
reg E;
always @(IN)
begin
case(IN)
	4'b1XXX: OUT= 2'b11;
	4'b01XX: OUT= 2'b10;
	4'b001X: OUT= 2'b01;
	4'b0001: OUT= 2'b00;
	default: OUT=2'bx;
			
	
endcase
end

//wire in2_not,d1xd2_not;
//NOT not1(IN[2],in2_not);
//AND and1(IN[1],in2_not,d1xd2_not);
//OR or1(IN[3],d1xd2_not,OUT[0]);
//
//OR or2(IN[2],IN[3],OUT[1]);
//
//wire y0,y1;
//OR or3(IN[0],IN[1],y0);
//OR or4(IN[2],IN[3],y1);
//OR or5(y0,y1,E);

endmodule



module MUX(D,S,O);
input [3:0]D;
input [1:0]S;
output O;
//reg O;
//always @( D ) 
//   begin
//    case ( S )
//      2'd0 : O = D[0];
//      2'd1 : O = D[1];
//      2'd2 : O = D[2];
//      2'd3 : O = D[3];
//      default : O = 1'bx;
//    endcase
//  end 


wire w0,w1,w2,w3;
assign w0 = (~S[0])&(~S[1])&D[0];
assign w1 = S[0]&(~S[1])&D[1];
assign w2 = (~S[0])&S[1]&D[2];
assign w3 = S[0]&S[1]&D[3];

assign O = w0|w1|w2|w3;

endmodule


module DEMUX(D,S,O);
input D;
input [1:0]S;
output [3:0]O;
wire n0,n1,o0,o1,o2,o3,z0,z1,z2,z3;
NOT not1(S[0],n0);
NOT not2(S[1],n1);
AND and1(n0,n1,z0);
AND and2(S[0],n1,z1);
AND and3(n0,S[1],z2);
AND and4(S[0],S[1],z3);
TRI trI1(D,z0,O[0]);
TRI trI2(D,z1,O[1]);
TRI trI3(D,z2,O[2]);
TRI trI4(D,z3,O[3]);


endmodule

//
//AND and5(z0,D,O[0]);
//AND and6(z1,D,O[1]);
//AND and7(z2,D,O[2]);
//AND and8(z3,D,O[3]);

//NOT not3(o0,O[0]);
//NOT not4(o1,O[1]);
//NOT not5(o2,O[2]);
//NOT not6(o3,O[3]);
