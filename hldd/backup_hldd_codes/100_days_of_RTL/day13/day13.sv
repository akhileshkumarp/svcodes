module day13#(
    parameter n = 3
)
(
    gnt,
    req,
    clk,
    rst
);

output reg [n:0] gnt;
input [n:0] req;
input clk, rst;

parameter R3 = 4'b1000;
parameter R2 = 4'b0100;
parameter R1 = 4'b0010;
parameter R0 = 4'b0001;

parameter rst_state = 4'b0000;

always @(posedge clk) begin
    if(rst) gnt <= rst_state;
    else if (req[3]) gnt <= R3;
    else if (req[2]) gnt <= R2;
    else if (req[1]) gnt <= R1;
    else if (req[0]) gnt <= R0;
    else gnt <= rst_state;
end

endmodule