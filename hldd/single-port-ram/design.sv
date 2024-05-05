module single_port_ram (
 
input clk i;// clock input
input rst_n_i;// Active low reset
input we_i;
 
// Write Enable input
 
input [6:0] addr_i;
 
// Address bus
 
// Data input output port
 
inout [7:0] data_io;
 
// Declare a 128-Bit x 8-Bit memory array
 
logic [7:0] ram [127:0];
 
// Read data when write is disabled 
assign data_io = (Iwe_i) ? ram [addr_il
 
always_ff @ (posedge clk_i) begin 
if (!rst_n_i) begin
 
// Initialize all memory locations to 0 
for (int i=; i<2; i++) begin 
ram[i] < hoop
 
end
 
end else begin
 
// Write data when write is enabled
 
if (we_i) 

begin
 
ram[addr_i] <= data_io;
 
end
 
end
 
end
 
endmodule