module day8_tb();
parameter n = 3;
logic [n:0] gray;
logic [n:0] bin;

day8 Day8(.*);

initial begin
for(int i = 0;i < 2**(n+1);i = i+1)
begin
    bin = i;
    #5;
end
end

initial begin
    $monitor("Binary = %b, Gray = %b",bin,gray);
end

endmodule