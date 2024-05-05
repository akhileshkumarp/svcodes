module single_port_ram_tb();

logic clk_i;
logic rst_n_i;
logic we_i;
logic [6:0] addr_i :
wire [7:01 data_io ;


// Handle IO port, temporary signal to provide input data 
logic [7:0] data_i;
// Provide write data when chip is selected and write is enabled 
assign data_io = (we_i) ? data_i : 8"hz;
// Instantiate single port RAM
single_port_ram dut (.*);
// Clock Generation
initial begin
c1k_i = 0:
forever #5 clk_i = ~c1k_i;
end
initial begin
// Initialize all inputs
rst_n_i=1`b1;
we_i = 1`b0;
addr_i = 7`h0;
data_i=0'h0;


// Apply Reset 
rst_n_i<= 1'b0; 
#20 @ (posedge clk_i); 
rst_n_i<=1'b1;
 
// Write to 0x45 to location 0x4 e 
@(posedge clk_i); 
we_i <=1'b1; 
addr_i <= 7`h4; 
data i <=8`h45;
 
// Write to 0x22 to location 0x5 
@(posedge clk_1); 
addr_1 <=7`h5; 
data i <= 8`h22;
 
//Read from location 0x4 
@(posedge clk_i);
 
we_i <= 1`b0;
addr_i <= 7`h4;
 
// Read from location 0x5 
@(posedge clk_1);
 
addr_i <= 7`h5;
 
end
 
endmodule