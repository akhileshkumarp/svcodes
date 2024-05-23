module day5(gnt_0,gnt_1,req_0,req_1,clk,rst);
output logic gnt_0,gnt_1;
input wire req_0,req_1,clk,rst;

parameter size = 3;
parameter IDLE = 3'b001;
parameter GNT_0 = 3'b010;
parameter GNT_1 = 3'b100;

logic [size-1:0] state, next_state;

always @(state or req_0 or req_1)
begin
    next_state = 3'b000;
    case(state)
        IDLE: if(req_0 == 1'b1) begin
            next_state = GNT_0;
        end
        else if (req_1 == 1'b1) begin
            next_state = GNT_1;
        end
        else begin 
            next_state = IDLE;
        end
        GNT_0: if(req_0 == 1'b1) begin
            next_state = GNT_0;
        end
        else begin
            next_state = IDLE;
        end
        GNT_1: if(req_1 == 1'b1) begin
            next_state = GNT_1;
        end
        else begin
            next_state = IDLE;
        end
        default: next_state = IDLE;
    endcase
end

always @(posedge clk)
begin
    if(rst == 1'b1) begin
        state <= IDLE;
    end
    else begin
        state <= next_state;
    end
end

always @(posedge clk)
begin
    if(rst == 1'b1)
    begin
        gnt_0 <= 1'b0;
        gnt_1 <= 1'b0;
    end
    else begin
        case(state)
            IDLE: begin
                gnt_0 <= 1'b0;
                gnt_1 <= 1'b0;
            end
            GNT_0: begin
                gnt_0 <= 1'b1;
                gnt_1 <= 1'b0;
            end
            GNT_1: begin
                gnt_0 <= 1'b0;
                gnt_1 <= 1'b1;
            end
            default: begin
                gnt_0 <= 1'b0;
                gnt_1 <= 1'b0;
            end
        endcase
    end
end

endmodule