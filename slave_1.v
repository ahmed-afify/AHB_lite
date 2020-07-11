// file: slave_1.v
// author: @ahmedafify

`timescale 1ns/1ns

module slave_1(output reg [31:0] HRDATA,
	  output reg [0:0] HREADYOUT, HRESP,
	  input HWRITE,HMASTCLOCK,HSEL,HREADY,
	  input [31:0] HADDR, HWDATA,
	  input [3:0] HPROT,
	  input [2:0] HSIZE,HBURST,
	  input [1:0] HTRANS );
	  
	  
	  
	
  always@(posedge(HMASTCLOCK))begin
  
  if(HSEL)begin
  HREADYOUT<=1'b1;
  HRDATA<=32'h10000000;
  HRESP<=1'b0;
    end
  else begin
  HRDATA<=HRDATA;
  HREADYOUT<=HREADYOUT;
  HRESP<=HRESP;
    end
  end
endmodule