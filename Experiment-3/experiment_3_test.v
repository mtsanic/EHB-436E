`timescale 1ns / 1ps
module deney_3_test;
	reg a;
	reg b;
	reg c;
	reg d;
	wire f3;
	wire f2;
	wire f1;
	wire f0;
	//with_SSI uut (
	//with_decoder uut (
	with_mux uut (
		.a(a), 
		.b(b), 
		.c(c), 
		.d(d), 
		.f3(f3), 
		.f2(f2), 
		.f1(f1), 
		.f0(f0));
	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		c = 0;
		d = 0;
		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here
		#50; {a,b,c,d} = 4'b0001; 
		#50; $display("giris: %b%b%b%b => cikis: %b%b%b%b", a,b,c,d,f3,f2,f1,f0);
		#50; {a,b,c,d} = 4'b0010; 
		#50; $display("giris: %b%b%b%b => cikis: %b%b%b%b", a,b,c,d,f3,f2,f1,f0);
		#50; {a,b,c,d} = 4'b0011; 
		#50; $display("giris: %b%b%b%b => cikis: %b%b%b%b", a,b,c,d,f3,f2,f1,f0);
		#50; {a,b,c,d} = 4'b0100; 
		#50; $display("giris: %b%b%b%b => cikis: %b%b%b%b", a,b,c,d,f3,f2,f1,f0);
		#50; {a,b,c,d} = 4'b0101; 
		#50; $display("giris: %b%b%b%b => cikis: %b%b%b%b", a,b,c,d,f3,f2,f1,f0);
		#50; {a,b,c,d} = 4'b0110; 
		#50; $display("giris: %b%b%b%b => cikis: %b%b%b%b", a,b,c,d,f3,f2,f1,f0);
		#50; {a,b,c,d} = 4'b0111; 
		#50; $display("giris: %b%b%b%b => cikis: %b%b%b%b", a,b,c,d,f3,f2,f1,f0);
		#50; {a,b,c,d} = 4'b1000; 
		#50; $display("giris: %b%b%b%b => cikis: %b%b%b%b", a,b,c,d,f3,f2,f1,f0);
		#50; {a,b,c,d} = 4'b1001; 
		#50; $display("giris: %b%b%b%b => cikis: %b%b%b%b", a,b,c,d,f3,f2,f1,f0);
		#50; {a,b,c,d} = 4'b1010; 
		#50; $display("giris: %b%b%b%b => cikis: %b%b%b%b", a,b,c,d,f3,f2,f1,f0);
		#50; {a,b,c,d} = 4'b1011; 
		#50; $display("giris: %b%b%b%b => cikis: %b%b%b%b", a,b,c,d,f3,f2,f1,f0);
		#50; {a,b,c,d} = 4'b1100; 
		#50; $display("giris: %b%b%b%b => cikis: %b%b%b%b", a,b,c,d,f3,f2,f1,f0);
		#50; {a,b,c,d} = 4'b1101; 
		#50; $display("giris: %b%b%b%b => cikis: %b%b%b%b", a,b,c,d,f3,f2,f1,f0);
		#50; {a,b,c,d} = 4'b1110; 
		#50; $display("giris: %b%b%b%b => cikis: %b%b%b%b", a,b,c,d,f3,f2,f1,f0);
		#50; {a,b,c,d} = 4'b1111; 
		#50; $display("giris: %b%b%b%b => cikis: %b%b%b%b", a,b,c,d,f3,f2,f1,f0);
		$finish;
	end
endmodule

