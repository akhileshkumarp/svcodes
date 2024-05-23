//Different flavors of a D flip-flop
module day2(q_norst_o,q_syncrst_o,q_asyncrst_o,d,clk,rst);
output logic q_norst_o,q_syncrst_o,q_asyncrst_o;
input logic d,clk,rst;

always @(posedge clk)
begin
    q_norst_o <= d;
end

always @(posedge clk)
begin
    if(rst == 1'b1)
        q_syncrst_o <= 1'b0;
    else 
        q_syncrst_o <= d;
end

always @(posedge clk or posedge rst)
begin
    if(rst == 1'b1)
        q_asyncrst_o <= 1'b0;
    else 
        q_asyncrst_o <= d;
end

endmodule