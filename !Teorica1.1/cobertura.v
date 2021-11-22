module cobertura  (L, U, Fd, Fe, A, F);
    input L, U, Fd, Fe;
    output A, F;

    assign A = ~L&~U&~Fd;
    assign F = (U&~Fe) | (L&~Fe);

endmodule


module cobertura_tb;
    reg L, U, Fd, Fe;
    wire A, F;

    cobertura uut(L, U, Fd, Fe, A, F);

    initial begin
        
        $dumpfile("cobertura_tb.vcd");
        $dumpvars(0, cobertura_tb);


        initial
            begin
            L = 0;
            U = 0;
            Fd = 0;
            Fe = 0;
            end


        always
            begin  
            #1 {L,U,Fd,Fe} = {L,U,Fd,Fe} + 1;
            end


        initial
            begin
            #8 $stop;
            end

    end

    initial begin
        $monitor ("No tempo %3t, L = %d, U = %d, Fe = %d, Fd = %d, A = %d, F = %d", $time, L, U, Fe, Fd, A, F);
    end

endmodule