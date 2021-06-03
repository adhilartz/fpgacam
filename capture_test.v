`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:07:11 04/19/2021
// Design Name:   ov7670_capture
// Module Name:   C:/Users/Achippu/Desktop/AAFPGA/FpgaCam/capture_test.v
// Project Name:  FpgaCam
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ov7670_capture
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module capture_test;

	// Inputs
	reg pclk;
	reg vsync;
	reg href;
	reg [7:0] d;

	// Outputs
	wire [16:0] addr;
	wire [11:0] dout;
	wire we;

	// Instantiate the Unit Under Test (UUT)
	ov7670_capture uut (
		.pclk(pclk), 
		.vsync(vsync), 
		.href(href), 
		.d(d), 
		.addr(addr), 
		.dout(dout), 
		.we(we)
	);

	initial begin
		// Initialize Inputs
		pclk = 1'b0;
		#50;
		vsync = 1'b0;
		#50;
		href = 1'b1;
		#50;
		d = 8'b11010010;
		
		// Initialize Inputs
		pclk = 1'b1;
		#50;
		vsync = 1'b1;
		#50;
		href = 1'b0;
		#50;
		d = 8'b00110110;
			// Initialize Inputs
		pclk = 1'b0;
		#50;
		vsync = 1'b0;
		#50;
		href = 1'b1;
		#50;
		d = 8'b00011110;
				
	end
      
endmodule

