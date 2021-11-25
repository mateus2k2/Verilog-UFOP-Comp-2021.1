
module aileron(ang, v1e, v2e, v1d, v2d);

	input signed [0:3] ang;
	output v1e, v2e, v1d, v2d;

    //De acordo com a tabela verdade é possivel encontrar as formulas para cara valvula
    assign v1e = (ang[0] & ang[3]) | (ang[0] & ang[2]) | (ang[0] & ang[1]);
    assign v2e = ~ang[1] | (~ang[2] & ~ang[3]);
    assign v1d = (~ang[0] & ang[1]) | (~ang[1] & ang[3]) | (~ang[1] & ang[2]) | (ang[1] & ~ang[2] & ~ang[3]);
    assign v2d = ang[1];

endmodule

module aileron_tb;

	reg signed [0:3] ang = -7;
	wire v1e, v2e, v1d, v2d;
    integer i;

	aileron aileron(ang, v1e, v2e, v1d, v2d);

	always begin
		#15 $stop;
	end

	always begin
		for (i = 0; i < 8; i = i + 1) begin
            #1 ang = ang + 1'b1;
        end
	end


	initial begin
		$dumpfile("aileron_tb.vcd");
		$dumpvars(0, aileron_tb);

		$display("ang \t v1e \t v2e \t v1d \t v2d");
		$monitor("%d \t %b \t %b \t %b \t %b", ang, v1e, v2e, v1d, v2d);
	end

endmodule