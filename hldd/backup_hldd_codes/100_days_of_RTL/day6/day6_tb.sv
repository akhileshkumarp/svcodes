module day6_tb();
logic clk_out;
logic clk,rst;

initial begin
    clk = 1'b1;
end

always begin
    #5 clk = ~clk;
end

day6 Day6(.*);

initial begin
    rst = 1'b1;
    #5 rst = 1'b0;
    #95 $finish();
end

initial begin
$dumpfile("day6.vcd");
$dumpvars(0,day6_tb);
end
endmodule