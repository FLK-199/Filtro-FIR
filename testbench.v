module testbench();
    reg clk_tb = 0;
    reg clr_tb;
    reg signed [9:0] entrada_tb;
    wire signed [17:0] saida_tb;

    always
        #5 clk_tb = ~clk_tb;

    initial begin
        clk_tb = 0;

        #1 clr_tb <= 0;
        #2 clr_tb <= 1;
        #3 clr_tb <= 0;
    end

    always @ (clk_tb == 1)
        entrada_tb = $random;

        #100 $finish

    filtro_FIR FIR (.entrada(entrada_tb), .saida(saida_tb), .clk(clk_tb), .clr(clr_tb));

endmodule