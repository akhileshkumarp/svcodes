module day10_tb();
parameter n =3;

logic [n:0] sum;
logic c_out;
logic [n:0] in1, in2;
logic c_in,op;

day10 #(n) Day10(.*);

initial begin
    for (int i = 0; i < 2**(n+1); i = i+1) begin
        #5 in1 = i;
        for(int j = 1; j < 2**(n+1); j = j+1) begin
            #5 in2 = j;
            #5 c_in = $random%2;
            #5 op = $random%2;
        end
    end
end

initial begin
    $dumpfile("day10.vcd");
    $dumpvars(0,day10_tb);
end
endmodule