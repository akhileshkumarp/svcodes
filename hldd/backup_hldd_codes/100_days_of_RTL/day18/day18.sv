module day18 #(
    parameter bin_width = 3,
    parameter one_hot_width = 8
)
(
    output [one_hot_width-1:0] one_hot,
    input [bin_width-1:0] bin
);

assign one_hot = 1'b1<<bin;

endmodule