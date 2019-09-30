`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:51:34 12/22/2016
// Design Name:   project2
// Module Name:   C:/Users/MTS-LENOVO/Desktop/ITU/EHB 436E/Project2/project2test.v
// Project Name:  Project2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: project2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module project2test;

	// Inputs
	reg x;
	reg clk;
	reg reset;

	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	project2 uut (
		.x(x), 
		.clk(clk), 
		.reset(reset), 
		.y(y)
	);
always begin clk = ~clk; #50; end

	initial begin
		// Initialize Inputs
		x = 0;
		clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#50;
        
		// Add stimulus here
		reset=0;  
		x=0;#100;
		x=0;#100;
		x=1;#100;
		x=0;#100;
		x=0;#100;
		
		x=1;#100;
		x=1;#100;
		x=0;#100;
		
		x=1;#100;
		x=0;#100;
		x=1;#100;
		
		x=0;#100;
		x=0;#100;
		x=0;#100;
		x=0;#100;
		x=1;#100;
		x=0;#100;
		x=1;#100;
		
		x=0;#100;
		x=0;#100;
		x=0;#100;
		x=0;#100;
		
		x=1;#100;
		x=0;#100;
		x=1;#100;
		x=1;#100;
		x=0;#100;
		x=1;#100;

	end
      
endmodule

