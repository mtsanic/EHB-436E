`timescale 1ns / 1ps
module AND (input I1,I2, output O);
assign O = ( I1 & I2 );
endmodule


module OR (input I1,I2, output O);
assign O = ( I1 | I2 );
endmodule

module NOT (input I, output O);
assign O = ~I;
endmodule

module NAND (input I1,I2, output reg O);
always @(*)
begin 
//O <= ~( I1 & I2 );
if (I1 == 1 && I2 == 1)
O <= 1'b0;
else O <= 1'b1;
end
endmodule

module NOR (input I1,I2, output reg O);
always @(*)
begin 
//O <= ~( I1 | I2 );
if (I1 == 0 && I2 == 0)
O <= 1'b1;
else O <= 1'b0;
end
endmodule

module XOR (input I0,I1, output O);
LUT2 #(
.INIT(4'h6) // Specify LUT Contents
) LUT2_inst (
.O(O), // LUT general output
.I0(I0), // LUT input
.I1(I1) // LUT input
);
endmodule

module XNOR (input I0,I1, output O);

LUT2 #(
.INIT(4'h9) // Specify LUT Contents
) LUT2_inst (
.O(O), // LUT general output
.I0(I0), // LUT input
.I1(I1) // LUT input
);
endmodule


module TRI (input I,E, output O);
assign O = ( E ) ? I : 1'bz ; 
endmodule

