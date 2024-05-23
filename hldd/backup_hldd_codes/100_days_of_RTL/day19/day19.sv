//A simple register file consisting four registers each having a width of 32-bits
module day19(
    output reg [31:0] ReadData1,
    output reg [31:0] ReadData2,
    input clk, reset,
    input [1:0] ReadReg1,
    input [1:0] ReadReg2,
    input [31:0] WriteData,
    input [1:0] WriteReg,
    input RegWrite
);

logic [3:0] register;
decoder2_4 my_decoder(register,WriteReg);


wire [3:0] clk_reg;

genvar no_of_clk;
generate
for(no_of_clk = 0; no_of_clk < 4; no_of_clk = no_of_clk + 1) begin
    assign clk_reg[no_of_clk] = RegWrite & clk & register[no_of_clk];
end
endgenerate

logic [31:0] q [0:3];

genvar no_of_reg;
generate
for(no_of_reg = 0; no_of_reg < 4; no_of_reg = no_of_reg + 1) begin
    reg_32bit my_32bit_reg(q[no_of_reg],WriteData,clk_reg[no_of_reg],reset);
end
endgenerate

mux4_1 mux1(ReadData1,q[0],q[1],q[2],q[3],ReadReg1);
mux4_1 mux2(ReadData2,q[0],q[1],q[2],q[3],ReadReg2);

endmodule


module d_ff(q,d,clk,reset);
output reg q;
input d, clk, reset;

always @(posedge clk) begin
    if(!reset)
        q <= 1'b0;
    else 
        q <= d; 
end

endmodule

module reg_32bit(q,d,clk,reset);
output reg [31:0] q;
input [31:0] d;
input clk, reset;

genvar i;
generate
for(i=0; i < 32; i = i + 1) begin
    d_ff d_flip_flop(q[i],d[i],clk,reset);
end
endgenerate

endmodule

module mux4_1(regData,q1,q2,q3,q4,reg_no);
output reg [31:0] regData;
input [31:0] q1,q2,q3,q4;
input [1:0] reg_no;

always @(reg_no or q1 or q2 or q3 or q4) begin
case(reg_no)
2'b00: regData = q1;
2'b01: regData = q2;
2'b10: regData = q3;
2'b11: regData = q4;
endcase
end

endmodule

module decoder2_4 (register,reg_no);
output reg [3:0] register;
input [1:0] reg_no;

always @(reg_no[0] or reg_no[1]) begin
    if(reg_no[1]==1'b0 & reg_no[0]==1'b0) register=4'b0001;
    else if(reg_no[1]==1'b0 & reg_no[0]==1'b1) register=4'b0010;
    else if(reg_no[1]==1'b1 & reg_no[0]==1'b0) register=4'b0100;
    else if(reg_no[1]==1 & reg_no[0]==1) register=4'b1000;
    else register=4'bxxxx;
end

endmodule