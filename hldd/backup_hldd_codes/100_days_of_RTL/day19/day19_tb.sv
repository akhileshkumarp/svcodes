module day19_tb();
logic [31:0] ReadData1;
logic [31:0] ReadData2;
logic clk, reset;
logic [1:0] ReadReg1;
logic [1:0] ReadReg2;
logic [31:0] WriteData;
logic [1:0] WriteReg;
logic RegWrite;

initial begin
    clk = 1'b1;
end

always #5 clk = ~clk;

day19 Day19(.*);

initial begin
    reset = 1'b0;
    RegWrite = 1'b0;
    #7 reset = 1'b1;
    RegWrite = 1'b1;
    @(posedge clk) WriteReg = 2'b00;
    @(posedge clk);
    WriteData = 32'hABABABAB;
    @(posedge clk) WriteReg = 2'b01;
    @(posedge clk);
    WriteData = 32'hBCBCBCBC;
    @(posedge clk) WriteReg = 2'b10;
    @(posedge clk);
    WriteData = 32'hCDCDCDCD;
    @(posedge clk) WriteReg = 2'b11;
    @(posedge clk);
    WriteData = 32'hDEDEDEDE;
    @(posedge clk);
    RegWrite = 1'b0;
    @(posedge clk);
    @(posedge clk);
    ReadReg1 = 2'b00;
    ReadReg2 = 2'b01;
    @(posedge clk);
    ReadReg1 = 2'b01;
    ReadReg2 = 2'b10;
    @(posedge clk);
    ReadReg1 = 2'b10;
    ReadReg2 = 2'b11;
    @(posedge clk);
    @(posedge clk);
    $finish();
end

initial begin
    $dumpfile("day19.vcd");
    $dumpvars(0,day19_tb);
end

endmodule