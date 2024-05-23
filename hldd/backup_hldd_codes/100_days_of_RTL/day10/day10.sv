module day10 #(
    parameter n = 3
)
(
    sum,
    c_out,
    in1,
    in2,
    c_in,
    op
);
output [n:0] sum;
output c_out;
input [n:0] in1, in2;
input c_in,op;

wire [n:0] final_in2;

genvar i;

for(i=0;i<=n;i++) begin
assign final_in2[i] = in2[i] ^ op;
end

assign {c_out,sum} = in1 + final_in2 + c_in;

endmodule