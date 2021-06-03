`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SYSU
// Engineer: liuzs
// 
// Create Date: 2018/12/03 21:37:38
// Design Name: 
// Module Name: ov7670_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ov7670_top(
input  clk100,
input  OV7670_VSYNC, //SCCBÐ­ÒéÊµÏÖ³¡Í¬²½ÐÅºÅÊäÈë
input  OV7670_HREF,  //SCCBÐ­ÒéÊµÏÖÐÐÍ¬²½ÐÅºÅÊäÈë
input  OV7670_PCLK,  //ÏñËØÊ±ÖÓÊäÈë
output OV7670_XCLK,  //ÉãÏñÍ·Çý¶¯Ê±ÖÓ
output OV7670_SIOC, 
inout  OV7670_SIOD,
input [7:0] OV7670_D, //Êý¾Ý´«ÊäÏß

output[3:0] LED,
output[3:0] vga_red,
output[3:0] vga_green,
output[3:0] vga_blue,
output vga_hsync, //´¹Ö±Í¬²½
output vga_vsync, //³¡Í¬²½
input btn,
output pwdn,
output reset
);
wire [16:0] frame_addr;
wire [16:0] capture_addr;   
//wire  capture_we;  
wire  config_finished;  
wire  clk25; 
wire  clk50;     
wire  resend;        
wire [11:0] frame_pixel;  
wire [11:0]  data_16;
  
assign pwdn = 0; //0ÎªÕý³£¹¤×÷£¬1ÎªµÍ¹¦ºÄÄ£Ê½
assign reset = 1;
  

assign LED = {3'b0,config_finished};
assign  	OV7670_XCLK = clk25;  
debounce   btn_debounce(
		.clk(clk50),
		.i(btn),
		.o(resend)
);
 
 vga   vga_display (
		.clk25       (clk25),
		.vga_red    (vga_red),
		.vga_green   (vga_green),
		.vga_blue    (vga_blue),
		.vga_hsync   (vga_hsync),
		.vga_vsync  (vga_vsync),
		.HCnt       (),
		.VCnt       (),

		.frame_addr   (frame_addr),
		.frame_pixel  (frame_pixel)
 );
 
 blk_mem_gen_0 u_frame_buffer(
		.clka (OV7670_PCLK),
		.wea  (1'b1),
		.addra (capture_addr),
		.dina  (data_16),

		.clkb   (clk25),
		.addrb (frame_addr),
		.doutb (frame_pixel)
 );
 

 ov7670_capture capture(         //Àý»¯ov7670ÉãÏñÍ·Çý¶¯
 		.pclk  (OV7670_PCLK),    //ÏñËØÊä³öÊ±ÖÓ
 		.vsync (OV7670_VSYNC),   //³¡Í¬²½
 		.href  (OV7670_HREF),    //´¹Ö±Í¬²½ 
 		.d     ( OV7670_D),      //Í¼ÏñÊý¾ÝÊä³ö
 		.addr  (capture_addr),   //´æ´¢¿éµÄµØÖ·
 		.dout( data_12),         //12Î»Êý¾ÝÊä³ö
 		.we   ()
 	);
 
I2C_AV_Config IIC(                 //ÉãÏñÍ·SCCBÐ­ÒéµÄÊµÏÖ
 		.iCLK   ( clk25),          //ÊäÈë25MHzÊ±ÖÓ
 		.iRST_N (! resend),        //¸´Î»
 		.Config_Done ( config_finished),    //¶Ôov7670µÄ¼Ä´æÆ÷½øÐÐÅäÖÃÍê³Éºó£¬·¢ËÍconfig_finishedÐÅºÅ
 		.I2C_SDAT  ( OV7670_SIOD),   //Êý¾Ý×ÜÏß 
 		.I2C_SCLK  ( OV7670_SIOC),   //¿ØÖÆÊ±ÖÓ×ÜÏß
 		.LUT_INDEX (),
 		.I2C_RDATA ()
 		); 
		
clk_wiz_0 clk_div(
		.clk_in1 (clk100),
		.clk_out1  (clk50),
		.clk_out2 (clk25)
);

endmodule
