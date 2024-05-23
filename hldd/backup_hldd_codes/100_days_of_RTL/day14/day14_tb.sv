module day14_tb();
logic [3:0] gnt;
logic [3:0] req;
logic clk,rst;

initial begin
    clk = 1'b1;
end

always #5 clk = ~clk;

day14 Day14(.*);

initial begin
    rst = 1'b1;
    #7 rst = 1'b0;
    @(posedge clk) req = 4'b0000;
    @(posedge clk) req = 4'b0001;
    @(posedge clk) req = 4'b0010;
    @(posedge clk) req = 4'b0011;
    @(posedge clk) req = 4'b0100;
    @(posedge clk) req = 4'b0101;
    @(posedge clk) req = 4'b0110;
    @(posedge clk) req = 4'b0111;
    @(posedge clk) req = 4'b1000;
    @(posedge clk) req = 4'b1001;
    @(posedge clk) req = 4'b1010;
    @(posedge clk) req = 4'b1011;
    @(posedge clk) req = 4'b1100;
    @(posedge clk) req = 4'b1101;
    @(posedge clk) req = 4'b1110;
    @(posedge clk) req = 4'b1111;
    #50 $finish;
end

initial begin
    $dumpfile("day14.vcd");
    $dumpvars(0,day14_tb);
end

endmodule
