// A simple Multiplexer
module day1(y,in_1,in_2,sel);
output wire y;
input wire in_1, in_2;
input wire sel;

assign y = (sel == 0) ? in_1 : in_2;

endmodule