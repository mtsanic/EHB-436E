`timescale 1ns / 1ps



module FA(input x,y,ci,output cout,s);
(* KEEP = "TRUE" *)
assign s = x ^ y ^ ci ;
assign cout = x&ci | y&ci | x&y ;
endmodule


module RCANEW(x, y , ci ,cout , s);
(* KEEP = "TRUE" *)
input [14:0] x;
input [14:0] y;
input ci;
output cout;
output [14:0]s;
wire w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13;

FA fa1(x[0],y[0],ci,w0,s[0]);
FA fa2(x[1],y[1],w0,w1,s[1]);
FA fa3(x[2],y[2],w1,w2,s[2]);
FA fa4(x[3],y[3],w2,w3,s[3]);
FA fa5(x[4],y[4],w3,w4,s[4]);
FA fa6(x[5],y[5],w4,w5,s[5]);
FA fa7(x[6],y[6],w5,w6,s[6]);
FA fa8(x[7],y[7],w6,w7,s[7]);
FA fa9(x[8],y[8],w7,w8,s[8]);
FA fa10(x[9],y[9],w8,w9,s[9]);
FA fa11(x[10],y[10],w9,w10,s[10]);
FA fa12(x[11],y[11],w10,w11,s[11]);
FA fa13(x[12],y[12],w11,w12,s[12]);
FA fa14(x[13],y[13],w12,w13,s[13]);
FA fa15(x[14],y[14],w13,cout,s[14]);

endmodule






module RCANEWW(x, y , ci ,cout , s);
(* KEEP = "TRUE" *)
input [18:0] x;
input [18:0] y;
input ci;
output cout;
output [18:0]s;

wire w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,w17;

FA fa1(x[0],y[0],ci,w0,s[0]);
FA fa2(x[1],y[1],w0,w1,s[1]);
FA fa3(x[2],y[2],w1,w2,s[2]);
FA fa4(x[3],y[3],w2,w3,s[3]);
FA fa5(x[4],y[4],w3,w4,s[4]);
FA fa6(x[5],y[5],w4,w5,s[5]);
FA fa7(x[6],y[6],w5,w6,s[6]);
FA fa8(x[7],y[7],w6,w7,s[7]);
FA fa9(x[8],y[8],w7,w8,s[8]);
FA fa10(x[9],y[9],w8,w9,s[9]);
FA fa11(x[10],y[10],w9,w10,s[10]);
FA fa12(x[11],y[11],w10,w11,s[11]);
FA fa13(x[12],y[12],w11,w12,s[12]);
FA fa14(x[13],y[13],w12,w13,s[13]);
FA fa15(x[14],y[14],w13,w14,s[14]);
FA fa16(x[15],y[15],w14,w15,s[15]);
FA fa17(x[16],y[16],w15,w16,s[16]);
FA fa18(x[17],y[17],w16,w17,s[17]);
FA fa19(x[18],y[18],w17,cout,s[18]);


endmodule












module MULTB(A,B,clk,reset,start,done,result
    );
input [7:0] A;
input [7:0] B;
input clk,reset,start;

output reg [15:0] result;
output reg done;


always @ (posedge clk)
begin

if(reset | (reset == 0 & start == 0)) begin
result <= 0;
done <= 0; end

else if(start) begin
result <= A*B;
done <=1; end


end

endmodule










module MULTS(A,B,clk,reset,start,done,result
    );
input [7:0] A;
input [7:0] B;
input clk,reset,start;
output reg [15:0] result;
output reg done;

wire [14:0]sum1;
wire [14:0]sum2;
wire [14:0]sum3;
wire [14:0]sum4;
wire [14:0]sum5;
wire [14:0]sum6;
wire [14:0]sum7;
wire a,b,c,d,e,f;

reg [14:0] regi[7:0]; 
integer i;

RCANEW rcanew1(regi[0],regi[1], 0,a, sum1); 
RCANEW rcanew2(sum1,regi[2], a,b, sum2);
RCANEW rcanew3(sum2,regi[3], b,c, sum3);
RCANEW rcanew4(sum3,regi[4], c,d, sum4);
RCANEW rcanew5(sum4,regi[5], d,e, sum5);
RCANEW rcanew6(sum5,regi[6], e,f, sum6);
RCANEW rcanew7(sum6,regi[7], f,cout, sum7);

always @ (posedge clk)
begin
	
	if(reset | (reset == 0 & start == 0)) 
	begin
		result <= 0;
		done <= 0; 
	end

	else if(start) 
	begin
		for(i=0;i<8;i=i+1) //B'nin bitlerini tek tek gez;
		begin
			if(B[i]==0) regi[i] <= 0; //B nin biti 0 ise reg'i 0la doldur;
			else regi[i] <= A << i ; // i kadar sola kaydýrýp reg'e ata;
		end
		
		result[14:0] <= sum7;
		result[15:15]<=cout;
		done <=1; 
	end

end

endmodule








module CWODSP(x11,x12,x13,x21,x22,x23,x31,x32,x33 ,k11,k12,k13,k21,k22,k23,k31,k32,k33 ,clk,reset,start,done,result
    );

input [7:0]	x11,x12,x13,x21,x22,x23,x31,x32,x33 ,k11,k12,k13,k21,k22,k23,k31,k32,k33;
input clk,reset,start;
output reg [19:0] result;
output reg done;

wire [7:0] x [2:0] [2:0];
wire [7:0] k [2:0] [2:0];
reg [18:0] w [2:0][2:0];

assign x[0][0] = x11;
assign x[0][1] = x12;
assign x[0][2] = x13;
assign x[1][0] = x21;
assign x[1][1] = x22;
assign x[1][2] = x23;
assign x[2][0] = x31;
assign x[2][1] = x32;
assign x[2][2] = x33;
assign k[0][0] = k11;
assign k[0][1] = k12;
assign k[0][2] = k13;
assign k[1][0] = k21;
assign k[1][1] = k22;
assign k[1][2] = k23;
assign k[2][0] = k31;
assign k[2][1] = k32;
assign k[2][2] = k33;





integer i;
integer j;


wire [18:0]sum1;
wire [18:0]sum2;
wire [18:0]sum3;
wire [18:0]sum4;
wire [18:0]sum5;
wire [18:0]sum6;
wire [18:0]sum7;
wire [18:0]sum8;
wire a,b,c,d,e,f,g;

RCANEWW rcanew1(w[0][0],w[0][1], 0,a, sum1); 
RCANEWW rcanew2(sum1,w[0][2], a,b, sum2);
RCANEWW rcanew3(sum2,w[1][0], b,c, sum3);
RCANEWW rcanew4(sum3,w[1][1], c,d, sum4);
RCANEWW rcanew5(sum4,w[1][2], d,e, sum5);
RCANEWW rcanew6(sum5,w[2][0], e,f, sum6);
RCANEWW rcanew7(sum6,w[2][1], f,g, sum7);
RCANEWW rcanew8(sum7,w[2][2], g,cout, sum8);

always @ (posedge clk)
begin
	
	if(reset | (reset == 0 & start == 0)) 
	begin
		result <= 0;
		done <= 0; 
	end

	else if(start) 
	begin

		
		
		for (i=0; i<3; i=i+1)
		begin
			for (j=0; j<3; j=j+1)
			begin
				w[i][j][18:16] <= 0;
				w[i][j][15:0]  <= k[2-i][2-j] * x[i][j];				
			end
		end
		
		
		
		result[18:0]  <= sum8;
		result[19:19] <=cout;
		done <=1; 
	end

end

endmodule
