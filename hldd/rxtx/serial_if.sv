interface serial_if(
  input clk,
  input rst
);
  
  logic [3:0] data_in    ;
  logic       valid_in   ;
  logic       busy_out   ;
  logic [3:0] data_out   ;
  logic       valid_out  ;
  
  logic       serial     ; // Serial Data
  logic       ready      ; // Ready from receiver

  // Modport for serial TX
  modport tx_mp(
    input  clk,
    input  rst,
    input  data_in,
    input  valid_in,
    output busy_out,
    output serial,
    input  ready
  );
  
  // Modport for serial RX
  modport rx_mp(
    input  clk,
    input  rst,
    output data_out,
    output valid_out,
    input  serial,
    output ready
  );
  
endinterface
