
class monitor;

  logic [4:0] s;
  
  virtual adder_if.mon_md mon_in;
  
 
  function new(virtual adder_if.mon_md intf);
    mon_in = intf;
  endfunction
  
  // Task to display
  task dis();
    #1
	s = mon_in.s;
    $display($time, "ns [MON] : A = %d, B = %d, Sum = %d", mon_in.a, mon_in.b, mon_in.s);
  endtask
  
endclass
