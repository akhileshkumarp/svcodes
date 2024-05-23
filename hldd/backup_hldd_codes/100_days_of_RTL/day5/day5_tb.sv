module day5_tb();
logic gnt_0, gnt_1;
reg req_0,req_1,clk,rst;

initial begin
    clk = 1'b1;
end

always begin
    #5 clk = ~clk;
end

day5 Day5(.*);

initial begin
    rst = 1'b1;
    req_0 = 1'b0;
    req_1 = 1'b0;
    #7 rst = 1'b0;
    #2 req_0 = 1'b1;
    req_1 = 1'b0;
    #12 req_0 = 1'b0;
    req_1 = 1'b0;
    #6 req_0 = 1'b0;
    req_1 = 1'b1;
    #9 req_0 = 1'b0;
    req_1 = 1'b1;
    #20 $finish();
end

initial begin
    $dumpfile("day5.vcd");
    $dumpvars(0,day5_tb);
end
endmodule