module Filtro_FIR_tb();
    parameter Width_In_tb = 10;
    parameter Width_Out_tb = 17;
    parameter Taps_tb = 7;

    reg clk_tb = 0;
    reg clr_tb = 0;
    reg [20:0] cont = 0;
    reg signed [Width_In_tb-1:0] entrada_tb;
    wire signed [Width_Out_tb-1:0] saida_tb;

    always
        #5 clk_tb = ~clk_tb;

    initial begin
        #0 clr_tb <= 0;
        #1 clr_tb <= 1;
        #2 clr_tb <= 0;
        entrada_tb <= 0;
    end

    always @ (posedge clk_tb) begin
        if (cont <= Taps_tb) begin
			if (cont == 1) begin
				entrada_tb <= 1;
			end
			else begin
				entrada_tb <= 0;
			end
		end
		else begin
			entrada_tb <= $random;
		end
		
		cont <= cont + 1;
    end
	
    Filtro_FIR #(.Width_In(Width_In_tb), .Width_Out(Width_Out_tb), .Taps(Taps_tb)) FIR (.entrada(entrada_tb), .saida(saida_tb), .clk(clk_tb), .clr(clr_tb));
endmodule