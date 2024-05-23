`include "adder.sv"
`include "comparator.sv"
`include "controlpath.sv"
`include "counter.sv"
`include "datapath.sv"
`include "register.sv"

module multiplier(multiplier_interface.dut_mp intf);

  // Internal Signal Decleration
  logic  load_p;
  logic  load_q;
  logic  load_f;
  logic  clr_f ;
  logic  dec_q ;
  logic  zero_val  ;

  // Datapath
  datapath datapath(
    .clk_in    (intf.clk_in   ), // Input Clock
    .rst_in    (intf.rst_in   ), // Input Reset
    .in_data   (intf.in_data  ), // Input Data [3:0]
    .out_data   (intf.out_data  ), // Output Data [7:0]
    .load_p_i (load_p       ), // Load Register P
    .load_q_i (load_q       ), // Load Q
    .load_f_i (load_f       ), // Load Register F
    .clr_f_i  (clr_f        ), // Clear Register F
    .dec_q_i  (dec_q        ), // Decrement Q
    .zero_val_o   (zero_val         )  // Q is zero_val
  );
  
  // Controlpath
  controlpath controlpath(
    .clk_in    (intf.clk_in   ), // Input Clock
    .rst_in    (intf.rst_in   ), // Input Reset
    .start_i  (intf.start_i ), // Start Multiplication
    .done_o   (intf.done_o  ), // Multiplication Done
    .zero_val_in   (zero_val         ), // Q is zero_val
    .load_p_o (load_p       ), // Load Register P
    .load_q_o (load_q       ), // Load  Q
    .load_f_o (load_f       ), // Load Register F
    .clr_f_o  (clr_f        ), // Clear Register F
    .dec_q_o  (dec_q        )  // Decrement Q
  );

endmodule