`timescale 1ns / 1ps
module project2( x, clk, reset, y );
input x, clk, reset;
output reg y;
reg [2:0] current,next;
reg [1:0] countera=2'b00, counterb=2'b00;

parameter first = 3'b001,
second = 3'b010,
third = 3'b011,
fourth = 3'b100,
fifth = 3'b101,
sixth = 3'b110,
seventh = 3'b111;


always @ (posedge clk) begin
if(reset)
current<=first;
else
current<=next;
end
always @ (current or x) begin

case (current)
first: begin
y=1'b0;
if(x==0)
next=second;
else
next=first;
end

second: begin
y=1'b0;
if(x==0)
next=third;
else
next=fifth;
end

third: begin
y=1'b0;
if(x==0)
next=fourth;
else
next=fifth;
end

fourth: begin
if(x==0) begin
y=1'b1;
countera<=countera+1;
if(countera==2'b10)
next=first;
else
next=fourth; end
else begin
y=1'b0;
next=fifth;
end
end

fifth: begin
y=1'b0;
if(x==0)
next=sixth;
else
next=first;
end

sixth: begin
y=1'b0;
if(x==0)
next=second;
else
next=seventh;
end

seventh: begin
y=1'b1;
counterb<=counterb+1;
if(counterb==2'b10)
next=first;
else begin
if(x==0) begin
next=sixth; end
else
next=first; 
end
end
default next=first;
endcase
end

endmodule
