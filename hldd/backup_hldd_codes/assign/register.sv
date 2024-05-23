
module register(
  input                 clk_in  , // Clk in
  input                 rst_in  , // Rst in
  input                 in_clear, // Clr in
  input                 in_load , // Ld
  input          [7:0]  in_data , // Datain [7:0]
  output  logic  [7:0]  out_data   // Dataout [7:0]
);

  always_ff @(posedge clk_in)begin
    if(rst_in)begin
    // Clear on reset
      out_data <= 8'h0;
    end else begin
      if(in_clear)begin
      // Clear data
        out_data <= 8'h0;
      end else if(in_load)begin
      // Load parallel data
        out_data <= in_data;
      end
    end
  end

endmodule