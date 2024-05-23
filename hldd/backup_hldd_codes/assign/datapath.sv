
module datapath(
  input          clk_in    , // Input Clock
  input          rst_in    , // Input Reset
  input   [3:0]  in_data   , // Input Data [3:0]
  output  [7:0]  out_data   , // Output Data [7:0]

  input          load_p_i , // Load Register P
  input          load_q_i , // Load Counter Q
  input          load_f_i , // Load Register F
  input          clr_f_i  , // Clear Register F
  input          dec_q_i  , // Decrement Counter Q
  output         zero_val_o     // Counter Q is zero_val
);
  // Intermediate Signal Decleration
  logic  [3:0] count;
  logic  [7:0] a;
  logic  [7:0] b;
  logic  [7:0] s;
  
  // Assign output result, stored in register F
  assign out_data = b;
  
  // Counter Q
  counter counter_q(
    .clk_in    (clk_in    ), // Input Clock
    .rst_in    (rst_in    ), // Input Reset
    .enable_i (dec_q_i  ), // Input Enable
    .in_load   (load_q_i ), // Input Load
    .in_data   (in_data   ), // Input data [3:0]
    .count_o  (count    )  // Output Count [3:0]
  );
  
  // Register P
  register register_p(
    .clk_in   (clk_in         ), // Input Clock
    .rst_in   (rst_in         ), // Input Reset
    .in_clear (1'b0          ), // Input Clear
    .in_load  (load_p_i      ), // Input Load
    .in_data  ({4'h0, in_data}), // Input Data [7:0]
    .out_data  (a             )  // Output Data [7:0]
  );
  
  // Register F
  register register_f(
    .clk_in   (clk_in   ), // Input Clock
    .rst_in   (rst_in   ), // Input Reset
    .in_clear (clr_f_i ), // Input Clear
    .in_load  (load_f_i), // Input Load
    .in_data  (s       ), // Input Data [7:0]
    .out_data  (b       )  // Output Data [7:0]
  );
  
  // Comparator
  comparator comparator(
    .a_in    (count ), // Input A [3:0]
    .zero_val_o (zero_val_o)  // Output A == 0
  );

  // Adder
  adder adder(
    .a_in (a), // Input A [7:0]
    .b_in (b), // Input B [7:0]
    .Sum_out (s)  // Output Sum [7:0]
  );

endmodule