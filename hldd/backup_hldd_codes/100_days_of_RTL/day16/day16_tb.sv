module day16_tb();
logic enable;
logic MemWrite;
logic clk;
logic [3:0] addr;
logic [3:0] DataIn;
logic [3:0] DataOut;

initial begin
    clk = 1'b1;
end

always #5 clk = ~clk;

day16 Day16(.*);

int i;
int j;
initial begin
    enable = 1'b0;
    MemWrite = 1'b0;
    addr = 4'b0000;
    @(posedge clk) enable = 1'b1;
    @(posedge clk) MemWrite = 1'b1;
    @(posedge clk);
    for(i = 0; i < 63; i = i + 1) begin
        addr = addr + 1'b1;
        DataIn = i % 4;
        @(posedge clk);
    end
    @(posedge clk);
    addr = 4'b0000;
    @(posedge clk) MemWrite = 1'b0;
    for(j = 0; j < 63; j = j + 1) begin
        addr = addr + 1'b1;
        @(posedge clk);
    end
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    $finish();
end

initial begin
    $dumpfile("day16.vcd");
    $dumpvars(0,day16_tb);
end

endmodule