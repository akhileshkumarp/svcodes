module day9
#(
    parameter n = 3 
)(
    bin,
    gray);
output [n:0] bin;
input [n:0] gray;

assign bin[n] = gray[n];

genvar i;

for(i=0; i<n; i = i+1) begin
    assign bin[n-i-1] = bin[n-i] + gray[n-i-1];
end

endmodule