
module cobertura(L, U, Fd, Fe, A, F);

    input L, U, Fd, Fe;
    output A, F;

    //De acordo com a tabela verdade é possivel encontrar as formulas para cara valvula
    assign A = ~L & ~U & ~Fd;
    assign F = (U & ~Fe) | (L & ~Fe);

endmodule

module cobertura_tb;
    reg L, U, Fd, Fe;
    wire A, F;
	integer i;

	cobertura cobertura(L, U, Fd, Fe, A, F);

   initial begin
	L = 0;
	U = 0;
	Fd = 0;
	Fe = 0;
	end

   always begin  
		#20 {L, U, Fd, Fe} = {L, U, Fd, Fe} + 1;
    end

	always begin
		#320 $stop;
	end

	initial begin
		$dumpfile("cobertura1.1.vcd");
		$dumpvars(0, cobertura_tb);

		$display("L \t U \t Fd \t Fe \t A \t F");
		$monitor("%d \t %b \t %b \t %b \t %b \t %b", L, U, Fd, Fe, A, F);
	end

endmodule