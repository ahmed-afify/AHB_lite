// file: AHB-lite.v
// author: @ahmedafify

`timescale 1ns/1ns

module AHB_lite(input clk, reset);

    wire [31:0] HRDATA;
	  wire HREADY, HRESP,HSEL_1,HSEL_2,HSEL_3,HSEL_DF;
	  wire HWRITE,HMASTCLOCK;
	  wire [31:0] HADDR, HWDATA;
	  wire [3:0] HPROT;
	  wire [2:0] HSIZE,HBURST;
	  wire [1:0] HTRANS;
	  wire [31:0] HRDATA_1,HRDATA_2,HRDATA_3,HRDATA_DF;
	  wire HREADYOUT_1,HREADYOUT_2,HREADYOUT_3,HREADYOUT_DF,HRESP_1,HRESP_2,HRESP_3,HRESP_DF;
	  
	  Master uut(HRDATA,
	            HREADY, 
	            HRESP,
	            clk, 
	            reset,
              HWRITE,
              HMASTCLOCK,
	            HADDR,
	            HWDATA,
	            HPROT,
	            HSIZE,
	            HBURST,
	            HTRANS);
	            
	   decoder uut1(HADDR,HSEL_1,HSEL_2,HSEL_3,HSEL_DF);
	   
	   multiplexer uut2( HRDATA,
	                    HREADY, 
	                    HRESP,
	                    HRDATA_1,
	                    HRDATA_2,
	                    HRDATA_3,
	                    HRDATA_DF,
	                    clk,
	                    reset,
	                    HREADYOUT_1,
	                    HREADYOUT_2,
	                    HREADYOUT_3,
	                    HREADYOUT_DF,
	                    HRESP_1,
	                    HRESP_2,
	                    HRESP_3,
	                    HRESP_DF,
  	                  HSEL_1,
  	                  HSEL_2,
  	                  HSEL_3,
  	                  HSEL_DF);
  	  
  	  slave_1 uut3(HRDATA_1,
	                 HREADYOUT_1, 
	                 HRESP_1,
	                 HWRITE,
	                 HMASTCLOCK,
	                 HSEL_1,
	                 HREADY,
	                 HADDR, 
	                 HWDATA,
  	               HPROT,
	                 HSIZE,
	                 HBURST,
	                 HTRANS);
	    
	     slave_2 uut4(HRDATA_2,
	                 HREADYOUT_2, 
	                 HRESP_2,
	                 HWRITE,
	                 HMASTCLOCK,
	                 HSEL_2,
	                 HREADY,
	                 HADDR, 
	                 HWDATA,
  	               HPROT,
	                 HSIZE,
	                 HBURST,
	                 HTRANS);
	                 
	     slave_3 uut5(HRDATA_3,
	                 HREADYOUT_3, 
	                 HRESP_3,
	                 HWRITE,
	                 HMASTCLOCK,
	                 HSEL_3,
	                 HREADY,
	                 HADDR, 
	                 HWDATA,
  	               HPROT,
	                 HSIZE,
	                 HBURST,
	                 HTRANS);
	                 
	      slave_default uut6(HRDATA_DF,
	                 HREADYOUT_DF, 
	                 HRESP_DF,
	                 HWRITE,
	                 HMASTCLOCK,
	                 HSEL_3,
	                 HREADY,
	                 reset,
	                 HADDR, 
	                 HWDATA,
  	               HPROT,
	                 HSIZE,
	                 HBURST,
	                 HTRANS);
	   
endmodule