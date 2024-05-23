module day18_tb();
parameter bin_width = 3;
parameter one_hot_width = 8;

logic [one_hot_width-1:0] one_hot;
logic [bin_width-1:0] bin;

day18 #(bin_width,one_hot_width) Day18(.*);

int i;

initial begin
    bin = 3'b000;
    for (i = 0; i < one_hot_width; i = i+1) begin
        bin = bin + 1'b1;
        #5;
    end
    $finish();
end

initial begin
    $dumpfile("day18.vcd");
    $dumpvars(0,day18_tb);
end

endmodule