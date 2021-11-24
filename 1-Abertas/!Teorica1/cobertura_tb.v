`timescale 1ps/1ps
`include "cobertura.v"

module cobertura_tb;
    reg L, U, Fd, Fe;
    wire A, F;

    cobertura uut(L, U, Fd, Fe, A, F);

    initial begin
        
        $dumpfile("cobertura_tb.vcd");
        $dumpvars(0, cobertura_tb);

        L = 0; U = 0; Fe = 0; Fd = 0; #20;
        L = 0; U = 0; Fe = 0; Fd = 1; #20;
        L = 0; U = 0; Fe = 1; Fd = 0; #20;
        L = 0; U = 0; Fe = 1; Fd = 1; #20;
        L = 0; U = 1; Fe = 0; Fd = 0; #20;
        L = 0; U = 1; Fe = 0; Fd = 1; #20;
        L = 0; U = 1; Fe = 1; Fd = 0; #20;
        L = 0; U = 1; Fe = 1; Fd = 1; #20;
        L = 1; U = 0; Fe = 0; Fd = 0; #20;
        L = 1; U = 0; Fe = 0; Fd = 1; #20;
        L = 1; U = 0; Fe = 1; Fd = 0; #20;
        L = 1; U = 0; Fe = 1; Fd = 1; #20;
        L = 1; U = 1; Fe = 0; Fd = 0; #20;
        L = 1; U = 1; Fe = 0; Fd = 1; #20;
        L = 1; U = 1; Fe = 1; Fd = 0; #20;
        L = 1; U = 1; Fe = 1; Fd = 1; #20;

        $display("Teste completo");

    end

    initial begin
        $monitor ("No tempo %3t, L = %d, U = %d, Fe = %d, Fd = %d, A = %d, F = %d", $time, L, U, Fe, Fd, A, F);
    end

endmodule