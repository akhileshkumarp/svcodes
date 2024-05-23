module day6(clk_out,clk,rst);
output clk_out;
input clk,rst;

logic clk_neg;

assign clk_neg = ~clk;

logic D_A,D_B,D_C;
logic Q_A,Q_B,Q_C;
logic neg_Q_A,neg_Q_B,neg_Q_C;

assign neg_Q_A = ~Q_A;
assign neg_Q_B = ~Q_B;
assign neg_Q_C = ~Q_C;

assign D_A = neg_Q_A & neg_Q_B;
assign D_B = Q_A;
assign D_C = Q_B;

assign clk_out = Q_C | D_C;

always @(posedge clk)
begin
    if(rst == 1'b1)
    begin
        Q_A <= 1'b0;
        Q_B <= 1'b0;
    end
    else begin
    Q_A <= D_A;
    Q_B <= D_B;
    end
end

always @(posedge clk_neg)
begin
    if(rst == 1'b1) begin
        Q_C <= 1'b0;
    end
    else begin
        Q_C <= D_C;
    end
end
endmodule