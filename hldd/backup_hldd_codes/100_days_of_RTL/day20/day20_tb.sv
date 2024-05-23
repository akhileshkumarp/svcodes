module day20_tb();
logic S,C;
logic clk,shift_control,clear,reset;
logic serial_input;

initial begin
    clk = 1'b1;
end

always #5 clk = ~clk;

day20 Day20(.*);

initial begin
    reset =  1'b0;
    shift_control = 1'b0;
    clear = 1'b0;
    serial_input = 1'b0;
    @(posedge clk);
    @(posedge clk);
    reset = 1'b1;
    shift_control = 1'b1;
    clear = 1'b1;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk) serial_input = 1'b0;
    @(posedge clk) serial_input = 1'b1;
    @(posedge clk) serial_input = 1'b1;
    @(posedge clk) serial_input = 1'b0;
    @(posedge clk) serial_input = 1'b0;
    @(posedge clk);
    @(posedge clk);
    #500;
    $finish();
end

initial begin
    $dumpfile("day20.vcd");
    $dumpvars(0,day20_tb);
end

endmodule