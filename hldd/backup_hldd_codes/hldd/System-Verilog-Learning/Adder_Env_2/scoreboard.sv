
class scoreboard;
  
  virtual adder_if.mon_md scb_in;
  


  // task to check the addition operation is correct or wrong
  task check(input logic [3:0] a, input logic [3:0] b, input logic [4:0] s);
    assert(s == a + b)
      $display($time, "ns [SCB] : PASS : A = %d, B = %d, Sum = %d", a, b, s);
    else
      $display($time, "ns [SCB] : FAIL : A = %d, B = %d, Sum = %d", a, b, s);
  endtask
  
endclass
