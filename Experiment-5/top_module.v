`timescale 1ns / 1ps
module SME(output o);
(* S = "TRUE" *)
wire x,y;
NOT not1(x,y);
NOT not2(y,x);
assign o = x;

endmodule


module SR_NOR(input S,R, output Q,Qn);

NOR nor1(R,Qn,Q);
NOR nor2(S,Q,Qn);

endmodule



module SR_NAND(input S,R, output Q,Qn);

NAND nand1(S,Qn,Q);
NAND nand2(R,Q,Qn);

endmodule

module SR_CONT(input S,R,E, output Q,Qn);
wire w1,w2;

NAND nand1(S,E,w1);
NAND nand2(R,E,w2);
NAND nand3(w1,Qn,Q);
NAND nand4(w2,Q,Qn);

endmodule

module D_LATCH(input D,E, output Q,Qn);
wire w1,w2,w3;

NOT not1(D,w3);
NAND nand1(D,E,w1);
NAND nand2(w3,E,w2);
NAND nand3(w1,Qn,Q);
NAND nand4(w2,Q,Qn);

endmodule

module MS_D_FF(input D,CLK, output Q,Qn);
wire w1,w2;

NOT not1(CLK,w2);
D_LATCH d_ff1(D,CLK,w1,);
D_LATCH d_ff2(w1,w2,Q,Qn);

endmodule

module ET_D_FF(input D,CLK, output Q,Qn);
wire s,r;
wire w1,w2,w3;

SR_NAND sr1(w1,CLK,,s);

AND and1(s,CLK,w2);
NAND nand1(w2,w1,r);
NAND nand2(r,D,w1);

SR_NAND sr3(s,r,Q,Qn);

endmodule


module D_FF_LS(input D,CLK, output Q,Qn);
reg FF;
assign Q = FF;

always @(posedge CLK)
begin 
	FF <= D;
end
NOT not1(Q,Qn);

endmodule




module REG_8BIT(SW,BTN,CLR,LED);
input  [7:0] SW;
input BTN,CLR;
output reg [7:0] LED;

always @(posedge BTN or posedge CLR)
begin 
	if(CLR)
	LED <= 0;
	else if(BTN)
	LED <= SW;
end

endmodule




module BR(clka,wea,addra,dina, douta);
input [3:0] addra;
input clka,wea;
input [7:0] dina;
output [7:0] douta;

bram blockram2(
  .clka(clka), // input clka
  .wea(wea), // input [0 : 0] wea
  .addra(addra), // input [3 : 0] addra
  .dina(dina), // input [7 : 0] dina
  .douta(douta) // output [7 : 0] douta
);





endmodule

