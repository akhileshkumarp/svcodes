

`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  

  virtual adder_if intf;
  generator gen;
  driver drv;
  monitor mon;
  scoreboard scb;
  

  // Pass the interface handles for driver and monitor
  function new(virtual adder_if intf);
    intf = intf;
    gen = new();
    drv = new(intf);
    mon = new(intf);
    scb = new();
  endfunction
  

  task run_env();
    repeat(5)begin
      gen.generate_value();
      drv.driv(gen.a, gen.b);
      mon.dis();
      scb.check(gen.a, gen.b, mon.s);
    end
  endtask
  
endclass
