module day11(in1,in2,op,alu_out);
input [7:0] in1,in2;
input [2:0] op;
output reg [7:0] alu_out;

parameter op_add = 3'b000;
parameter op_sub = 3'b001;
parameter op_sll = 3'b010;
parameter op_lsr = 3'b011;
parameter op_and = 3'b100;
parameter op_or = 3'b101;
parameter op_xor = 3'b110;
parameter op_eql = 3'b111;

logic carry;

always @(in1 or in2 or op)
begin
    case(op)
        op_add: begin
            {carry,alu_out} = {1'b0,in1} + {1'b0,in2};
        end
        op_sub: begin
            alu_out = in1 - in2;
        end
        op_sll: begin
            alu_out = in1[7:0]<<in2[2:0];
        end
        op_lsr: begin
            alu_out = in1[7:0]>>in2[2:0];
        end
        op_and: begin
            alu_out = in1 & in2;
        end
        op_or: begin
            alu_out = in1 | in2;
        end
        op_xor: begin
            alu_out = in1 ^ in2;
        end
        op_eql: begin
            alu_out = (in1 == in2) ? 1:0;
        end
    endcase
end

endmodule