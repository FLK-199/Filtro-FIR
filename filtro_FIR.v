module Filtro_FIR #(
    parameter Width_In = 10,
    parameter Width_Out = 17,
    parameter Taps = 7
)

(
    input signed [Width_In-1:0] entrada, 
    output reg signed [Width_Out-1:0] saida, 
    input clk, 
    input clr
);
    reg signed [Width_In-1:0] X[Taps-2:0];
    integer i;

    always @ (posedge clk or posedge clr) begin
        if(clr) begin
            for(i = 0; i <= Taps-2; i=i+1) begin
                X[i] <= 0;
            end

            saida <= 0;
        end 
        else begin
            X[0] <= entrada;
            for(i = 1; i <= Taps-2; i=i+1) begin
                X[i] <= X[i-1];
            end
            
            saida <= entrada*(-1) + X[0]*(3) + X[1]*(-5) + X[2]*(10) + X[3]*(-4) + X[4]*(2) + X[5]*(-2);
        end
    end
endmodule 