module day15(
    output penable,
    output psel,
    output [31:0] paddr,
    output [31:0] pdata,
    output pwrite,
    input clk,
    input rst,
    input [31:0] prdata,
    input pready,
    input [1:0] cmd
);

parameter [1:0] idle_state = 2'b00;
parameter [1:0] setup_state = 2'b01;
parameter [1:0] access_state = 2'b10;

logic [1:0] state, next_state;
logic [31:0] rdata;

always @(posedge clk) begin
    if(rst) begin
        state <= idle_state;
    end
    else state <= next_state;
end

always @(*) begin
    case(state)
        idle_state: begin
            if(|cmd)
                next_state = setup_state;
            else
                next_state = idle_state;
        end
        setup_state: begin
            next_state = access_state;
        end
        access_state: begin
            if(pready) next_state = idle_state;
            else next_state = access_state;
        end
        default: next_state = idle_state;
    endcase
end

always @(posedge clk) begin
    if(rst)
        rdata <= 32'h0;
    else if (penable && pready)
        rdata <= prdata;
end

assign psel = (state == setup_state) | (state == access_state);
assign penable = (state == access_state);
assign pwrite = cmd[1];
assign paddr = 32'hDEAD_CAFE;
assign pdata = rdata + 32'b1;

endmodule