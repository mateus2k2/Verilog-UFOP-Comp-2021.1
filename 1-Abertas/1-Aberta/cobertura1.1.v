
module cobertura(ang, v1e, v2e, v1d, v2d);

    input L, U, Fd, Fe;
    output A, F;

    //De acordo com a tabela verdade é possivel encontrar as formulas para cara valvula
    assign A = ~L&~U&~Fd;
    assign F = (U&~Fe) | (L&~Fe);
endmodule

module cobertura_tb;

	reg signed [0:3] ang = -7;
	wire v1e, v2e, v1d, v2d;
    integer i;

	cobertura cobertura(ang, v1e, v2e, v1d, v2d);

	always begin
		#15 $stop;
	end

	always begin
		for (i = 0; i < 8; i = i + 1) begin
            #1 ang = ang + 1'b1;
        end
	end


	initial begin
		$dumpfile("cobertura_tb.vcd");
		$dumpvars(0, cobertura_tb);

		$display("ang \t v1e \t v2e \t v1d \t v2d");
		$monitor("%d \t %b \t %b \t %b \t %b", ang, v1e, v2e, v1d, v2d);
	end

endmodule