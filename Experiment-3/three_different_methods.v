`timescale 1ns / 1ps

//module with_SSI(input a,b,c,d, output f3,f2,f1,f0);
//
//
//(* LOC = "SLICE_X1Y1" *)
//
//
//AND and1(b,d,f0);
//
//wire w1,w2;
//AND and2(a,b,w1);
//AND and3(c,d,w2);
//AND and4(w1,w2,f3);
//
//wire n1,n2;
//wire w3,w4;
//AND and5(a,c,w3);
//NOT not1(b,n1);
//NOT not2(d,n2);
//OR or1(n1,n2,w4);
//AND and6(w3,w4,f2);
//
//wire w5,w6;
//AND and7(b,c,w5);
//AND and8(a,d,w6);
//XOR xor1(w5,w6,f1);
//
//endmodule

//module with_decoder(input a,b,c,d, output f3,f2,f1,f0);
//
//(* OPTIMIZE = "OFF" *)
//
//wire [15:0]m;
//DECODER decoder1({a,b,c,d},m);
//
//wire o1,o2,o3,o4,o5,o6,o7;
//
//OR or1(m[5],m[7],o1);
//OR or2(m[13],m[15],o2);
//OR or3(o1,o2,f0);
//
//OR or4(m[6],m[7],o3);
//OR or5(m[9],m[11],o4);
//OR or6(m[13],m[14],o5);
//OR or7(o3,o4,o6);
//OR or8(o5,o6,f1);
//
//OR or9(m[10],m[11],o7);
//OR or10(m[14],o7,f2);
//
//assign f3=m[15];
//
//
//endmodule



module with_mux(input a,b,c,d, output f3,f2,f1,f0);

wire w1,w3,w4;

AND and1(b,d,w1);
XOR xor1(b,d,w3);
NOT not1(w1,w4);


MUX mux1({w1,w1,w1,w1}, {a,c} ,f0);
MUX mux2({w3,d,b,1'b0}, {a,c} ,f1);
MUX mux3({w4,1'b0,1'b0,1'b0}, {a,c} ,f2);
MUX mux4({w1,1'b0,1'b0,1'b0}, {a,c} ,f3);


endmodule