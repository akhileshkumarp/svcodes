module day3_tb();
logic rising_edge, falling_edge;
logic d,clk;

initial begin
    clk = 1'b1;
end

always begin
    #5 clk = ~clk;
end

day3 Day3(.*);

initial begin
    d = 1'b0;
    #3 d = 1'b1;
    #8 d = 1'b0;
    #5 d = 1'b1;
    #6 d = 1'b0;
    #5 $finish();
end

initial begin
    $dumpfile("day3.vcd");
    $dumpvars(0, day3_tb);
  end

endmodule