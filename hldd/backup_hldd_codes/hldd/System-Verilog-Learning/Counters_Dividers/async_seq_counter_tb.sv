//----------------------------------------------------------------------------
// Title       : Asynchronous Counter Testbench
// File        : async_seq_counter_tb.sv
//----------------------------------------------------------------------------

module async_seq_counter_tb();

  logic       clk_i  ;
  logic       rst_n_i;
  logic [2:0] q_o    ;

  async_seq_counter dut(.*);
  
  initial begin
    clk_i = 0;
    forever #5 clk_i = ~clk_i;
  end
  
  initial begin
    rst_n_i = 1'b1;
    
    // Apply Reset
    #10 rst_n_i = 1'b0;
    #10 rst_n_i = 1'b1;

  end
  
endmodule