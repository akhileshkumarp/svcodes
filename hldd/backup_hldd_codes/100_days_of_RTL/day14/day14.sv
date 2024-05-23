module day14(gnt,req,clk,rst);
output logic [3:0] gnt;
input [3:0] req;
input clk,rst;

reg [2:0] state;
reg [2:0] next_state;

parameter [2:0] s_default = 3'b000;
parameter [2:0] s_0 = 3'b001;
parameter [2:0] s_1 = 3'b010;
parameter [2:0] s_2 = 3'b011;
parameter [2:0] s_3 = 3'b100;

always @(posedge clk) begin
    if(rst)
        state <= s_default;
    else
        state <= next_state;
end

always @(*) begin
    case(state)
    s_default: begin
        if(req[0]) begin next_state = s_0; end
        else if(req[1]) begin next_state = s_1; end
        else if(req[2]) begin next_state = s_2; end
        else if(req[3]) begin next_state = s_3; end
        else begin next_state = s_default; end
    end
    s_0: begin
        if(req[1]) begin next_state = s_1; end
        else if(req[2]) begin next_state = s_2; end
        else if(req[3]) begin next_state = s_3; end
        else if(req[0]) begin next_state = s_0; end
        else begin next_state = s_default; end
    end
    s_1: begin
        if(req[2]) begin next_state = s_2; end
        else if(req[3]) begin next_state = s_3; end
        else if(req[0]) begin next_state = s_0; end
        else if(req[1]) begin next_state = s_1; end
        else begin next_state = s_default; end
    end
    s_2: begin
        if(req[3]) begin next_state = s_3; end
        else if(req[0]) begin next_state = s_0; end
        else if(req[1]) begin next_state = s_1; end
        else if(req[2]) begin next_state = s_2; end
        else begin next_state = s_default; end
    end
    s_3: begin
        if(req[0]) begin next_state = s_0; end
        else if(req[1]) begin next_state = s_1; end
        else if(req[2]) begin next_state = s_2; end
        else if(req[3]) begin next_state = s_3; end
        else begin next_state = s_default; end
    end
    default: begin
        if(req[0]) begin next_state = s_0; end
        else if(req[1]) begin next_state = s_1; end
        else if(req[2]) begin next_state = s_2; end
        else if(req[3]) begin next_state = s_3; end
        else begin next_state = s_default; end
    end
    endcase
end

always @(*) begin
    case(state)
    s_0: begin gnt = 4'b0001; end
    s_1: begin gnt = 4'b0010; end
    s_2: begin gnt = 4'b0100; end
    s_3: begin gnt = 4'b1000; end
    default: begin gnt = 4'b0000; end
    endcase
end

endmodule
