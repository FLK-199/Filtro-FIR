module testbench();
    reg clk_tb = 0;
    reg clr_tb = 0;
    reg signed [9:0] entrada_tb;
    wire signed [17:0] saida_tb;

    always
        #5 clk_tb = ~clk_tb;

    initial begin
        #1 clr_tb <= 0;
        #2 clr_tb <= 1;
        #3 clr_tb <= 0;
	#100 $finish;
    end

    always @ (posedge clk_tb)
        entrada_tb <= $random;
	
    filtro_FIR FIR (.entrada(entrada_tb), .saida(saida_tb), .clk(clk_tb), .clr(clr_tb));
endmodule