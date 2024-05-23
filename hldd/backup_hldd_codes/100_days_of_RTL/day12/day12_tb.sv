module day12_tb();
logic out;
logic in,clk,rst;

initial begin
    clk = 1'b1;
end

always #5 clk = ~clk;

day12 Day12(.*);

initial begin
    rst = 1'b1;
    #12 rst = 1'b0;
    in = 1'b0;
    @(posedge clk) in <= 1; 
    @(posedge clk) in <= 0; 
    @(posedge clk) in <= 1; 
    @(posedge clk) in <= 1; 
    @(posedge clk) in <= 1; 
    @(posedge clk) in <= 0; 
    @(posedge clk) in <= 0; 
    @(posedge clk) in <= 1;
    @(posedge clk) in <= 1; 
    @(posedge clk) in <= 0; 
    @(posedge clk) in <= 0; 
    @(posedge clk) in <= 1; 
    @(posedge clk) in <= 1; 
    @(posedge clk) in <= 1; 
    @(posedge clk) in <= 0;
    @(posedge clk) in <= 1; 
    @(posedge clk) in <= 1; 
    @(posedge clk) in <= 1;

    #50 $finish;
end

initial begin
    $dumpfile("day12.vcd");
    $dumpvars(0,day12_tb);
end

endmodule