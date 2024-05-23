
module adder(
  input   [7:0]  a_in, // Input A [7:0]
  input   [7:0]  b_in, // Input B [7:0]
  output  [7:0]  Sum_out  // Output Sum [7:0]
);
  
  // Assign sum output
  assign Sum_out = a_in + b_in;

endmodule