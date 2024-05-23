module day9_tb();
parameter n = 3;
logic [n:0] gray;
logic [n:0] bin;

day9 #(n) Day9(.*);

initial begin
for(int i = 0;i < 2**(n+1);i = i+1)
begin
    gray = i;
    #5;
end
end

initial begin
    $monitor("Gray = %b, Binary = %b",gray,bin);
end

endmodule