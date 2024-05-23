// A 4-bit serial adder
module day20(S,C,clk,shift_control,serial_input,clear,reset);
inout S,C;
input clk,shift_control,clear,reset;
input serial_input;

wire clk_ff;

assign clk_ff = clk & shift_control;

logic x,y,z;

flip_flop ff1(z,C,clk_ff,clear);
shift_register_augend shift_reg1(x,S,clk,reset,shift_control);
shift_register_addend shift_reg2(y,serial_input,clk,reset,shift_control);
full_adder fa1(S,C,x,y,z);
endmodule

//Full Adder
module full_adder(S,C,x,y,z);
output S,C;
input x,y,z;

assign {C,S} = x + y + z;
endmodule

//Flip-flop
module flip_flop(q,d,clk,rst);
output reg q;
input d,clk,rst;

always @(posedge clk) begin
if(!rst) q <= 1'b0;
else q <= d;
end
endmodule

//Shift Register for Augend
module shift_register_augend(out,din,clk,reset,shift_control);
output out;
input din;
input clk, reset;
input shift_control;

reg [3:0] r_reg;
wire [3:0] r_next;

always @(posedge clk) begin
    if(!reset) begin
        r_reg <= 4'b0000;
    end
    else if(shift_control) begin
        r_reg <= r_next;
end
end

assign r_next = {din,r_reg[3:1]};
assign out = r_reg[0];

endmodule

//Shift Register for Addend
module shift_register_addend(out,din,clk,reset,shift_control);
output out;
input din;
input clk, reset;
input shift_control;

reg [3:0] r_reg;
wire [3:0] r_next;

always @(posedge clk) begin
    if(!reset) begin
        r_reg <= 4'b0000;
    end
    else if(shift_control) begin
        r_reg <= r_next;
end
end

assign r_next = {din,r_reg[3:1]};
assign out = r_reg[0];

endmodule