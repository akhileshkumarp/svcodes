
`include "environment.sv"

class test;


  environment env;
  
  virtual adder_if intf;
  


  function new(virtual adder_if intf);
    intf = intf;
    env  = new(intf);
  endfunction
  
  // Task to run  environment
  task run_test();
    env.run_env();
  endtask

endclass
