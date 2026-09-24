module filtro_FIR(entrada, saida, clk, clr);
    input clk;
    input clr;
    input signed [9:0] entrada;
    output reg signed [17:0] saida;

    reg signed [9:0] X[5:0];

    always @ (posedge clk or posedge clr) begin
        if(clr) begin
            X[0] <= 0; X[1] <= 0; X[2] <= 0; X[3] <= 0; X[4] <= 0; X[5] <= 0;
            saida <= 0;
        end 
        else begin
            X[0] <= entrada;
            X[1] <= X[0];
            X[2] <= X[1];
            X[3] <= X[2];
            X[4] <= X[3];
            X[5] <= X[4];
            
            saida <= entrada*(-1) + X[0]*(3) + X[1]*(-5) + X[2]*(10) + X[3]*(-4) + X[4]*(2) + X[5]*(-2);
        end
    end
endmodule 