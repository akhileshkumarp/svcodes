module day17_tb();
logic y_ter;
logic y_case, y_ifelse, y_aor;
logic [3:0] in;
logic [3:0] sel;

day17 Day17(.*);

initial begin
    for (int i =0; i<32; i++) begin
      in  = $urandom_range(0, 4'hF);
      sel = 1'b1 << $urandom_range(0, 2'h3); // one-hot
      #5;
    end
    $finish();
end

initial begin
    $dumpfile("day17.vcd");
    $dumpvars(0,day17_tb);
end

endmodule