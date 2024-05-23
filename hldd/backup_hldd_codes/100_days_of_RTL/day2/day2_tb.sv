module day2_tb();
logic q_norst_o,q_syncrst_o,q_asyncrst_o;
logic d,clk,rst;

day2 Day2(.*);

initial begin
    clk = 1'b0;
end

always begin
   #5 clk = ~clk;
end

initial
begin
    rst= 1'b1;
    d = 1'b0;
    @(posedge clk);
    rst = 1'b0;
    @(posedge clk);
    d = 1'b1;
    @(posedge clk);
    @(posedge clk);
    @(negedge clk);
    rst = 1'b1;
    @(posedge clk);
    @(posedge clk);
    rst = 1'b0;
    @(posedge clk);
    @(posedge clk);
    $finish();
end

initial
begin
    $monitor("d = %b,rst = %b,q_norst_o = %b,q_syncrst_o = %b,q_asyncrst_o = %b",d,rst,q_norst_o,q_syncrst_o,q_asyncrst_o);
end

endmodule