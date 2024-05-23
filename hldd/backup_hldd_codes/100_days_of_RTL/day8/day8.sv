module day8(gray,bin);
parameter n = 3;
output [n:0] gray;
input [n:0] bin;

genvar i;

for (i = 0; i < n; i=i+1) begin
    assign gray[n-i-1] = bin[n-i-1] + bin[n-i];
end

assign gray[n] = bin[n];

endmodule