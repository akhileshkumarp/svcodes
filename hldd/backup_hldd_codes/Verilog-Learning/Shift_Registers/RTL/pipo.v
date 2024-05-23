//--------------------------------------------------------------------------------
// File         : pipo.v
// Dependencies : 
// Description  : 4-bit parallel in parallel out shift register
//--------------------------------------------------------------------------------

module pipo(
  input            clk_i , // Clock
  input            rst_i , // Reset
  input            load_i, // Load eanble input
  input      [3:0] data_i, // Parallel data input
  output reg [3:0] data_o  // Parallel data output
);
  
  // Sequential Logic
  always@(posedge clk_i)begin
    if(rst_i)begin
	// Clear on reset
      data_o <= 'h0;
    end else begin
	  if(load_i)begin
	  // Load parallel data
	    data_o <= data_i;
	  end
    end
  end
  
endmodule