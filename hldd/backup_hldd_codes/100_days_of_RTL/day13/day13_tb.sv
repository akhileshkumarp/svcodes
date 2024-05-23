module day13_tb();

parameter n = 3;

logic [n:0] gnt;
logic [n:0] req;
logic clk,rst;

day13 #(n) Day13(.*);

initial begin
    clk = 1'b1;
end

always #5 clk = ~clk;

initial begin
    rst = 1'b1;
    #7 rst = 1'b0;
    #4 req = 4'b0001;
    #5 req = 4'b0010;
    #5 req = 4'b0011;
    #5 req = 4'b0100;
    #5 req = 4'b0101;
    #5 req = 4'b0110;
    #5 req = 4'b0111;
    #5 req = 4'b1000;
    #5 req = 4'b1001;
    #5 req = 4'b1010;
    #5 req = 4'b1011;
    #5 req = 4'b1100;
    #5 req = 4'b1101;
    #5 req = 4'b1110;
    #5 req = 4'b1111;
    #10 $finish;
end

initial begin
    $dumpfile("day13.vcd");
    $dumpvars(0,day13_tb);
end

endmodule