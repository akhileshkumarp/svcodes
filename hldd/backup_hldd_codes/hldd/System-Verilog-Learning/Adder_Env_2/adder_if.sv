

interface adder_if();
  logic [3:0] a; 
  logic [3:0] b;
  logic [4:0] s; 
  
// Modports 
  modport drv_md(
    output a,
    output b
  );
  

  modport mon_md(
    input a,
    input b,
    input s
  );
  

  modport dut_md(
    input  a,
    input  b,
    output s
  );

endinterface
