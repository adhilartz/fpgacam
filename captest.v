`timescale 1ns / 1ps
module captest;
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
		pclk = 1'b1;
		#50;
		vsync = 1'b0;
		#50;
		href = 1'b1;
		#50;
		d = 10100011;
		#50;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
	end
      
endmodule

