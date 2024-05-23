
module comparator(
  input    [3:0]  a_in   , // Input A [3:0]
  output          zero_val_o  // Output A == 0
);
  
  // Need to check for 1 instead of 0 as decrement and comparison in same cycle
  assign zero_val_o = (a_in == 4'h1);
  
endmodule