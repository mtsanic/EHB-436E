`timescale 1ns / 1ps

module imageProcess( clk,reset,w1,w2,w3,w4,w5,w6,w7,w8,w9 );

input clk,reset;

output [7:0] w1,w2,w3,w4,w5,w6,w7,w8,w9;
reg [7:0] r2,r3,r5,r6,r8,r9;
reg [14:0] addra = 0;
wire [7:0] douta;

BRam BR1 (
  .clka(clk), // input clka
  .wea(1'b0), // input [0 : 0] wea
  .addra(addra), // input [14 : 0] addra
//  .dina(1'b0), // input [7 : 0] dina
  .douta(douta) // output [7 : 0] douta
);


reg [1039:0] LBuffer1 ;
reg [1039:0] LBuffer2 ;

assign w1 = douta;
assign w4 = LBuffer1[7:0] ;
assign w7 = LBuffer2[7:0] ;

assign w3 = r3;
assign w6 = r6;
assign w9 = r9;
assign w2 = r2;
assign w5 = r5;
assign w8 = r8;

always @(posedge clk)
begin
if(reset) begin
r3<=0;
r6<=0;
r9<=0;
r2<=0;
r5<=0;
r8<=0;
addra <= 0;
end

else begin

r3 <= r2;
r2 <= w1;

r6 <= r5;
r5 <= w4;

r9 <= r8;
r8 <= w7;

if (addra < 16900)
begin
addra <= addra + 1;
LBuffer1 <= {w1,LBuffer1[1039:8]} ;
LBuffer2 <= {w4,LBuffer2[1039:8]} ;
end 


end
end

endmodule



module adderTree (Wn1,Wn2,Wn3,Wn4,Wn5,Wn6,Wn7,Wn8,Wn9,clk  ,result);
input [7:0] Wn1,Wn2,Wn3,Wn4,Wn5,Wn6,Wn7,Wn8,Wn9;
input clk;
output reg [15:0]result;

wire [15:0] a1,a2,a3,a4,a5,a6,a7,a8,a9;

assign a1 = 0;
assign a2 = ~Wn2 + 1'b1;
assign a3 = 0;
assign a4 = ~Wn4 + 1'b1;
assign a5 = Wn5 * 4;
assign a6 = ~Wn6 + 1'b1;
assign a7 = 0;
assign a8 = ~Wn8 + 1'b1;
assign a9 = 0;

reg [15:0] stage1_1, stage1_2, stage1_3, stage1_4;
reg [15:0] stage2_1, stage2_2;
reg [15:0] stage3;

always @ (posedge clk)
begin
stage1_1 <= a1 + a2;
stage1_2 <= a3 + a4;
stage1_3 <= a5 + a6;
stage1_4 <= a7 + a8;

stage2_1 <= stage1_1 + stage1_2;
stage2_2 <= stage1_3 + stage1_4;

stage3   <= stage2_1 + stage2_2;

result <= stage3 + a9;

end


endmodule
