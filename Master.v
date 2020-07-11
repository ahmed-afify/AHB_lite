// file: Master.v
// author: @ahmedafify

`timescale 1ns/1ns

module Master(
    input [31:0] HRDATA,
	  input HREADY, HRESP,clk, reset,
	  output reg [0:0] HWRITE,
	  output wire [0:0] HMASTCLOCK,
	  output reg [31:0] HADDR, HWDATA,
	  output reg [3:0] HPROT,
	  output reg [2:0] HSIZE,HBURST,
	  output reg [1:0] HTRANS);
    localparam S1=2'b00;
    localparam S2=2'b01;
    localparam S3=2'b10;
    localparam SF=2'b11;
    reg [1:0] state;
   
  
	  
	  always@(posedge(clk) or posedge(reset))
	  begin
		if(reset)begin
		    HWRITE<=32'b0;
	      HPROT<=0;
	      HSIZE<=0;
	      HBURST<=0;
	      HTRANS<=0;
	      HWDATA<=0;
	   	  state<=S1;
		    HADDR<=32'h10000000;
		 end
		else if(HREADY)
	  begin
			case (state)
			
			2'b00: begin
			    HADDR<=32'h10000000;
			    state<=S2;
			      end
		  2'b01: begin
		      HADDR<=32'h20000000;
			    state<=S3;
			    end
			       
			2'b10: begin
			    HADDR<=32'h30000000;
			    state<=SF;
			    end
		  2'b11:  begin
	        HADDR<=32'hF0000000;
			    state<=S1;
			    end
		
			endcase
		
		end

		end
	 
    assign HMASTCLOCK=clk;
 
   

endmodule