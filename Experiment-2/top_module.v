`timescale 1ns / 1ps
module top_module( sw , btn, led, seg, dp,  an);

input [7:0]sw;
input [3:0]btn;
output [7:0] led;
output [6:0] seg;
output dp;
output [3:0] an;


//DECODER decoder1(  sw[3:0], {dp, seg, led} );
//assign an = 4'b1110;
//
ENCODER encoder1(sw[3:0],led[7:7] ,led[1:0]);

//MUX mux1(sw[3:0],btn[1:0],led[0:0]);

//DEMUX demux1(sw[0:0],btn[1:0],led[3:0]);
endmodule
