`timescale 1ns / 1ps

module WITH_SSI(input a,b,c,d, output f3,f2,f1,f0);

AND and1(b,d,f0);

wire w1,w2;
AND and2(a,b,w1);
AND and3(c,d,w2);
AND and4(w1,w2,f3);

wire n1,n2;
wire w3,w4;
AND and5(a,c,w3);
NOT not1(b,n1);
NOT not2(d,n2);
OR or1(n1,n2,w4);
AND and6(w3,w4,f2);

wire w5,w6;
AND and7(b,c,w5);
AND and8(a,d,w6);
XOR xor1(w5,w6,f1);

endmodule

