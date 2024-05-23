module day7_tb();
parameter size = 3;
logic [size:0] d_out;
logic d_in,clk,rst;

initial begin
    clk = 1'b1;
end

always begin
    #5 clk = ~clk;
end

day7 Day(.*);

initial
begin
    rst = 1'b1;
    d_in = 1'b1;
    @(posedge clk);
    rst = 1'b0;
    @(posedge clk);
    for (int i=0; i<16; i=i+1) begin
      d_in = $random%2;
      @(posedge clk);
    end
    $finish();
end

initial begin
    $dumpfile("day7.vcd");
    $dumpvars(0,day7_tb);
end
endmodule