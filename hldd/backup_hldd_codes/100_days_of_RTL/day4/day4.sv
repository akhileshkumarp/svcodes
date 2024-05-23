module day4(count,clk,rst);
output logic [3:0] count;
input wire clk,rst;

always @(posedge clk)
begin
    if(rst==1'b1)
        count <= 4'b0000;
    else
        count <= count + 1'b1;
end

endmodule