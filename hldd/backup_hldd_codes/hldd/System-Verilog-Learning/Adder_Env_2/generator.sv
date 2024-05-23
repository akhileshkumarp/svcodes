

class generator;
  
  logic [3:0] a;
  logic [3:0] b;
  
  //random values for A and B
  task generate_value();
    a = $random();
    b = $random();
    $display($time, "ns [GEN] : A = %d, B = %d", a, b);
  endtask
  
endclass
