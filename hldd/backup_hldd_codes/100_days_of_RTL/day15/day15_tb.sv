module day15_tb();
logic penable;
logic psel;
logic [31:0] paddr;
logic [31:0] pdata;
logic pwrite;
logic clk;
logic rst;
logic [31:0] prdata;
logic pready;
logic [1:0] cmd;

initial begin
    clk = 1'b1;
end

always #5 clk = ~clk;

day15 Day15(.*);

int cycles = 15;

always begin
    pready = 1'b0;
    while (cycles) begin
        @(posedge clk);
        cycles--;
    end
    pready = 1'b1;
    @(posedge clk);
    @(posedge clk);
end

initial begin
    rst <= 1'b1;
    cmd <= 2'b00;
    prdata <= 32'h0;
    @(posedge clk);
    rst <= 1'b0;
    @(posedge clk);
    @(posedge clk);
    for (int i=0; i<10; i++) begin
      cmd <= i%2 ? 2'b10 : 2'b01;
      prdata <= 4'hB;
      while (~pready | ~psel) @(posedge clk);
      @(posedge clk);
    end
    $finish();
end

initial begin
    $dumpfile("day15.vcd");
    $dumpvars(0,day15_tb);
end

endmodule