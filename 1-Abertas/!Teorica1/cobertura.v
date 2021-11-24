module cobertura  (L, U, Fd, Fe, A, F);
    input L, U, Fd, Fe;
    output A, F;

    assign A = ~L&~U&~Fd;
    assign F = (U&~Fe) | (L&~Fe);

endmodule

