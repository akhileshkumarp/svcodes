module day12(out,in,clk,rst);
output out;
input in,clk,rst;

logic [2:0] state, next_state;

parameter S0 = 0;
parameter S1 = 1;
parameter S2 = 2;
parameter S3 = 3;
parameter S4 = 4;

always @(posedge clk)
begin
    if(rst)
        state <= S0;
    else
        state <= next_state;
end

always @(state or in) begin
    case(state)
        S0: begin
            if(in) next_state = S0;
            else next_state = S1;
        end
        S1: begin
            if(in) next_state = S2;
            else next_state = S1;
        end
        S2: begin
            if(in) next_state = S3;
            else next_state = S1;
        end
        S3: begin
            if(in) next_state = S4;
            else next_state = S1;
        end
        S4: begin
            if(in) next_state = S0;
            else next_state = S1;
        end
    endcase
end

assign out = (state == S4) ? 1:0;

endmodule