module day1_tb();
logic y;
logic in_1,in_2;
logic sel;

day1 Day1(.*);

initial
begin
sel = 0; in_1 = 0; in_2 = 0;
#5 sel = 0; in_1 = 0; in_2 = 1;
#5 sel = 0; in_1 = 1; in_2 = 0;
#5 sel = 0; in_1 = 1; in_2 = 1;
#5 sel = 1; in_1 = 0; in_2 = 0;
#5 sel = 1; in_1 = 0; in_2 = 1;
#5 sel = 1; in_1 = 1; in_2 = 0;
#5 sel = 1; in_1 = 1; in_2 = 1;
end

initial
begin
$monitor("y = %b, sel = %b, in_1 = %b, in_2 = %b",y,sel,in_1,in_2);
end

initial begin
    $dumpfile("day1.vcd");
    $dumpvars(0, day1_tb);
end

endmodule