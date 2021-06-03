`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:05:06 05/31/2021
// Design Name:   ov7670_capture
// Module Name:   C:/Users/Achippu/Desktop/AAFPGA/FpgaCam/TB_capture.v
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

module TB_capture;

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
		pclk = 0;
		vsync = 0;
		href = 0;
		d = 8'd10110101;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

