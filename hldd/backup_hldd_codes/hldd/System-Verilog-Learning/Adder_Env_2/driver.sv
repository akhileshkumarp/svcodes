

class driver;

  virtual adder_if.drv_md drv_in;
  

  function new(virtual adder_if.drv_md intf);
    drv_in = intf;
  endfunction
  
  
  // Get the values for A and B 
  task driv(input logic [3:0] a, input logic [3:0] b);
    drv_in.a = a;
    drv_in.b = b;
    $display($time, "ns [DRV] : A = %d, B = %d", drv_if.a, drv_if.b);
  endtask
  
endclass
