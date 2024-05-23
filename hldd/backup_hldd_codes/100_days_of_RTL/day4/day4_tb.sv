module day4_tb();
logic [3:0] count;
reg clk, rst;

day4 Day4(.*);

initial begin
    clk = 1'b1;
end

always begin
    #5 clk = ~clk;
end

initial
begin
    rst = 1'b1;
    #3 rst = 1'b0;
    #197 $finish();
end

initial begin
    $dumpfile("day4.vcd");
    $dumpvars(0,day4_tb);
end

endmodule