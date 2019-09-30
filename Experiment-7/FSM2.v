`timescale 1ns / 1ps

module FSM2( input x , clk,reset, output z);
reg q0,q1,q2;
wire Q0,Q1,Q2,a;

assign Q0 = (a & ~q1 & ~q0) ;
assign Q1 = a & (q1 ^ q0);
assign Q2 = ~x ;
assign a = x ^ q2;
assign z = (a & q1 & ~q0);

always @ (posedge clk)
begin 
if(reset) begin
q0 <= 0;
q1 <= 0;
q2 <= 0;
end
else begin
q0 <= Q0;
q1 <= Q1;
q2 <= Q2;
end
end

endmodule
