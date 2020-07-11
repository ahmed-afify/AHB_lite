// file: slave_default.v
// author: @ahmedafify

`timescale 1ns/1ns

module slave_default(output reg [31:0] HRDATA,
	  output reg [0:0] HREADYOUT, HRESP,
	  input HWRITE,HMASTCLOCK,HSEL,HREADY,reset,
	  input [31:0] HADDR, HWDATA,
	  input [3:0] HPROT,
	  input [2:0] HSIZE,HBURST,
	  input [1:0] HTRANS);
  
  
  always@(posedge(HMASTCLOCK) or posedge(reset))begin
  
  if(reset==1)
        HRESP<=1;
      
  else if(HSEL & HREADY) begin
  	    HREADYOUT<=0;
				HRESP<=1;
				HRDATA	<=32'hFFFFFFFF;
    end
    else if(HRESP & (~HREADY))begin
        HREADYOUT<=0;
				HRESP<=1;
    end
    
    else if(HRESP & HREADY)
       	HRESP<=0;
     
       
    else begin
        HREADYOUT<=1;
				HRESP<=0;
    end
  
  end

endmodule