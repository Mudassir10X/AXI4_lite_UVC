module tb_top();

    bit clk, reset;

    axi_if #(
        .ADDR_WIDTH  (32),
        .DATA_WIDTH  (32)
    ) axi_if (.clk(ACLK), .rst(ARESETn));

    always #10 clk = ~clk;

endmodule