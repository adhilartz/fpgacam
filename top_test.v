`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:50:12 04/19/2021
// Design Name:   ov7670_top
// Module Name:   C:/Users/Achippu/Desktop/AAFPGA/FpgaCam/top_test.v
// Project Name:  FpgaCam
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ov7670_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module top_test;

	// Inputs
	reg clk100;
	reg OV7670_VSYNC;
	reg OV7670_HREF;
	reg OV7670_PCLK;
	reg [7:0] OV7670_D;
	reg btn;

	// Outputs
	wire OV7670_XCLK;
	wire OV7670_SIOC;
	wire [3:0] LED;
	wire [3:0] vga_red;
	wire [3:0] vga_green;
	wire [3:0] vga_blue;
	wire vga_hsync;
	wire vga_vsync;
	wire pwdn;
	wire reset;

	// Bidirs
	wire OV7670_SIOD;

	// Instantiate the Unit Under Test (UUT)
	ov7670_top uut (
		.clk100(clk100), 
		.OV7670_VSYNC(OV7670_VSYNC), 
		.OV7670_HREF(OV7670_HREF), 
		.OV7670_PCLK(OV7670_PCLK), 
		.OV7670_XCLK(OV7670_XCLK), 
		.OV7670_SIOC(OV7670_SIOC), 
		.OV7670_SIOD(OV7670_SIOD), 
		.OV7670_D(OV7670_D), 
		.LED(LED), 
		.vga_red(vga_red), 
		.vga_green(vga_green), 
		.vga_blue(vga_blue), 
		.vga_hsync(vga_hsync), 
		.vga_vsync(vga_vsync), 
		.btn(btn), 
		.pwdn(pwdn), 
		.reset(reset)
	);

	initial begin
		// Initialize Inputs
		clk100 = 1'b1;
		#50;
		OV7670_VSYNC = 1'b1;
		#50;
		OV7670_HREF = 1'b1;
		#50;
		OV7670_PCLK = 1'b1;
		#50;
		OV7670_D = 8'b10011101;
		#50;
		btn = 1'b0;
		// Wait 100 ns for global reset to finish
		#100;
    	// Add stimulus here

		// Initialize Inputs
		clk100 = 1'b0;
		#50;
		OV7670_VSYNC = 1'b0;
		#50;
		OV7670_HREF = 1'b0;
		#50;
		OV7670_PCLK = 1'b1;
		#50;
		OV7670_D = 8'b11011101;
		#50;
		btn = 1'b1;
		// Wait 100 ns for global reset to finish
		#100;
    	// Add stimulus here

	end
      
endmodule

