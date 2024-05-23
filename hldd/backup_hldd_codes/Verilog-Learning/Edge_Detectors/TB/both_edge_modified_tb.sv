//--------------------------------------------------------------------------------
// File         : both_edge_modified_tb.sv
// Dependencies : both_edge.v
// Description  : Testbench for both edge detector
//--------------------------------------------------------------------------------

module both_edge_modified_tb();

  // Signal Decleration
  reg  clk_i;
  reg  rst_i;
  reg  d_i  ;
  wire y_1_o;
  wire y_2_o;

  // Instantiation
  both_edge_modified dut(
    .clk_i (clk_i),
	.rst_i (rst_i),
    .d_i   (d_i  ),
	.y_1_o (y_1_o),
    .y_2_o (y_2_o)
  );

  // Clock generation
  initial begin
    clk_i = 1'b0;
    forever #5 clk_i = ~clk_i;
  end

  // Logic to drive inputs
  initial begin
    rst_i = 0; d_i = 0; // Initialize inputs
    
    // Apply Reset
    @(negedge clk_i);
    rst_i <= 1'b1;
    @(negedge clk_i);
    rst_i <= 1'b0;
    
	@(posedge clk_i);
	d_i <= 1'b1;
	#30 d_i <= 1'b0;
	
    #50 $finish;
  end

endmodule