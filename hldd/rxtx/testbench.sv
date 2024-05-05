module testbench();

  logic       clk        ;
  logic       rst        ;

  serial_if intf(.clk (clk),.rst (rst));
  
  // Insatntaite Design
  serial serial(intf);

  initial begin
    clk = 1'b0;
    forever #10 clk = ~clk;
  end
  
  task apply_reset();
    begin
      @(posedge clk);
      rst = 1'b1;
      repeat(4) @(posedge clk);
      rst = 1'b0;
    end
  endtask
  
  task send_data(
    input [3:0] data_in
  );
    begin
      @(posedge clk);
      intf.valid_in = 1'b1;
      intf.data_in  = data_in;
      wait(intf.busy_out);
      @(posedge clk);
      intf.valid_in = 1'b0;
      intf.data_in  = 4'h0;
      wait(intf.valid_out);
    end
  endtask
  
  initial begin
    rst = 1'b0;
    intf.data_in = 4'h0;
    intf.valid_in = 1'b0;
    
    apply_reset();
    send_data(4'h5);
    send_data(4'hA);
    send_data(4'h6);
    send_data(4'h9);
    
    #400 $finish;
    
  end
  
endmodule
