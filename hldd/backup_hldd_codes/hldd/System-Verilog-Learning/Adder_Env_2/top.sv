
`include "adder_if.sv"
`include "test.sv"

module top();
  
 
  adder_if intf();
  
 
  adder dut(intf.dut_md);

  test test1 = new(intf);
  
  // Run the test
  initial begin
    test1.run_test();
    #10 $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end

endmodule
