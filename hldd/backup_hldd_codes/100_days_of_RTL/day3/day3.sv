module day3(rising_edge,falling_edge,d,clk);
output wire rising_edge,falling_edge;
input wire d,clk;

logic q;

always @(posedge clk)
begin
    q <= d;
end

assign rising_edge = d & (~q);

assign falling_edge = (~d) & q;
endmodule