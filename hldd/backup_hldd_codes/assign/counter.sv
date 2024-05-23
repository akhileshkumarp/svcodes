
module counter(
  input                 clk_in    , // Input Clock
  input                 rst_in    , // Input Reset
  input                 enable_i , // Input Enable
  input                 in_load   , // Input Load
  input          [3:0]  in_data   , // Input data [3:0]
  output  logic  [3:0]  count_o    // Output Count [3:0]
);

  always_ff @(posedge clk_in)begin
    if(rst_in)begin
    // Clear count upon Reset
      count_o <= 4'h0;
    end else begin
      if(in_load)begin
      // Load count value
        count_o <= in_data;
      end else if(enable_i)begin
      // Decrement count value
        count_o <= count_o - 1'b1;
      end
    end
  end

endmodule