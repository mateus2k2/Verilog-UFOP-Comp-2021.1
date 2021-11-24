
module Aileron(ang, v1e, v2e, v1d, v2d);

	input signed [3:0] ang;
	output reg v1e, v2e, v1d, v2d;

	always @(ang) begin
		if      (ang <= -4) {v1e, v2e, v1d, v2d} = 4'b1100;
		else if (ang <= -1) {v1e, v2e, v1d, v2d} = 4'b1000;
		else if (ang >= 4)  {v1e, v2e, v1d, v2d} = 4'b0011;
		else if (ang >= 1)  {v1e, v2e, v1d, v2d} = 4'b0010;
		else /* ang == 0 */ {v1e, v2e, v1d, v2d} = 4'b0x0x;
	end

endmodule

module Main;

	reg signed [3:0] ang = -7;
	wire v1e, v2e, v1d, v2d;

	Aileron aileron (ang, v1e, v2e, v1d, v2d);

	always begin
		#1 ang++;
	end

	always begin
		#15 $stop;
	end

	initial begin
		$dumpfile("aileron.dump");
		$dumpvars(ang, v1e, v2e, v1d, v2d);
		$display("0 : Valvula fechada");
		$display("1 : Valvula aberta");
		$display("ang \t v1e \t v2e \t v1d \t v2d");
		$monitor("%d \t %b \t %b \t %b \t %b", ang, v1e, v2e, v1d, v2d);
	end

endmodule