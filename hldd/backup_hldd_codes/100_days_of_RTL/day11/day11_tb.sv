module day11_tb();
logic [7:0] in1,in2;
logic [2:0] op;
logic [7:0] alu_out;

day11 Day11(.*);

initial begin
    for (int j =0; j<3; j++) begin
      for (int i =0; i<7; i++) begin
        in1 = $urandom_range(0, 8'hFF);
        in2 = $urandom_range(0, 8'hFF);
        op = 3'(i);
        #5;
      end
    end
end

initial begin
    $dumpfile("day11.vcd");
    $dumpvars(0,day11_tb);
end
endmodule