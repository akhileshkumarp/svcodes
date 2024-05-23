module day7(d_out,d_in,clk,rst);
parameter size = 3;
output reg [size:0] d_out;
input d_in,clk,rst;

always @(posedge clk)
begin
    if(rst == 1'b1) begin
        d_out <= 4'b0000;
    end
    else begin
        d_out <= {d_out[size-1:0],d_in};
    end
end

endmodule