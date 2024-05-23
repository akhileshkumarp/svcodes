interface multiplier_interface(
  input clk_in,
  input rst_in
);

  logic         start_i;
  logic  [3:0]  in_data ;
  logic  [7:0]  out_data ;
  logic         done_o ;
  
  // Modport for DUT
  modport dut_mp(
    input   clk_in  ,
    input   rst_in  ,
    input   start_i,
    input   in_data ,
    output  out_data ,
    output  done_o
  );
  
  // Modport for Testbench
  modport tb_mp(
    input   clk_in  ,
    input   rst_in  ,
    input   out_data ,
    input   done_o ,
    output  start_i,
    output  in_data 
    
  );
  
endinterface