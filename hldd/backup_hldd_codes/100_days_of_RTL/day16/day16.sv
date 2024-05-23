module day16(
    input enable,
    input MemWrite,
    input clk,
    input [3:0] addr,
    input [3:0] DataIn,
    output [3:0] DataOut
);

reg [3:0] DataOut;
reg [3:0] Memory[0:63];

always @ (posedge clk or MemWrite) begin
    if(enable) begin
        if(MemWrite) Memory[addr] <= DataIn;
        else DataOut <= Memory[addr];
    end
end

endmodule