module day17(y_ter,y_case,y_ifelse,y_aor,in,sel);
output y_ter;
output logic y_case, y_ifelse, y_aor;
input [3:0] in;
input [3:0] sel;

//Mux design using ternary operator
assign y_ter =  sel[0] ? in[0]:
                sel[1] ? in[1]:
                sel[2] ? in[2]:
                         in[3];

//Mux design using case statement
always @(in or sel) begin
case(sel)
4'b0001: y_case = in[0];
4'b0010: y_case = in[1];
4'b0100: y_case = in[2];
4'b1000: y_case = in[3];
default: y_case = 1'bz;
endcase
end

//Mux design using if-else statement
always @(in or sel) begin
if(sel[0]) y_ifelse = in[0];
else if(sel[1]) y_ifelse = in[1];
else if(sel[2]) y_ifelse = in[2];
else if(sel[3]) y_ifelse = in[3];
else y_ifelse = 1'bz;
end

//Mux design using AND-OR tree
assign y_aor =  (sel[0] & in[0]) |
                (sel[1] & in[1]) |
                (sel[2] & in[2]) |
                (sel[3] & in[3]);

endmodule