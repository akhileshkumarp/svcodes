`include "multiplier_interface.sv"

module multiplier_test();

  logic         clk_in  ;
  logic         rst_in  ;
  
  // Instantiate Interface
  multiplier_interface intf(clk_in, rst_in);
  
  // DUT
  multiplier multiplier(intf.dut_mp);
  
  // Clock Gen
  initial begin
    clk_in = 0;
    forever #5 clk_in = ~clk_in;
  end
  
  // Task to drive and verify output
  task multipliy(
    input logic [3:0] a_in,
    input logic [3:0] b_in
  );
    // Apply start signal
    @(posedge clk_in);
    intf.tb_mp.start_i <= 1'b1;
    // Apply Input 1
    @(posedge clk_in);
    intf.tb_mp.start_i <= 1'b0;
    intf.tb_mp.in_data  <= a_in;
    // Apply Input 2
    @(posedge clk_in);
    intf.tb_mp.in_data  <= b_in;
    // Wait until multiplication done
    wait(intf.tb_mp.done_o);
    @(posedge clk_in);
    // Check result
    assert(intf.tb_mp.out_data == a_in * b_in)
      $display("[PASS]: A = %d, B = %d, Result = %d", a_in, b_in, intf.tb_mp.out_data);
    else
      $display("[FAIL]: A = %d, B = %d, Result = %d", a_in, b_in, intf.tb_mp.out_data);
  endtask
  
  initial begin
    // Initialize all inputs
    rst_in   = 0;
    intf.tb_mp.start_i = 0;
    intf.tb_mp.in_data  = 0;
    
    // Apply Reset
    @(posedge clk_in);
    rst_in <= 1'b1;
    repeat(5)
      @(posedge clk_in);
    rst_in <= 1'b0;
    
    // random inputs
    repeat(6)
      multipliy($random, $random);
    
    #20 $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, multiplier_test.intf);
  end
  
endmodule