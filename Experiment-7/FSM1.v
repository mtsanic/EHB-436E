`timescale 1ns / 1ps

module FSM1( input x , clk, output z);
reg q0,q1,q2, Z;
assign z = (~x & q1 & ~q0) | (x & q2 & q0) ;


wire Q0,Q1,Q2;
assign Q0 = (~q2 & ~q1 & ~q0) | (x & ~q1) | (x & ~q0 & ~q2) ;
assign Q1 = (~q1 & ~q2 & q0) | (q1 & ~q0) | (~q2 & ~q1 & x) ;
assign Q2 = (x & q1 & q0) | (x & q2) ;
initial q0=1;
initial q1=1;
initial q2=1;

always @ (posedge clk)
begin 
//if(reset) begin
//q0 <= 1;
//q1 <= 1;
//q2 <= 0;
//end
//else begin
q0 <= Q0;
q1 <= Q1;
q2 <= Q2;
//end
end

endmodule








