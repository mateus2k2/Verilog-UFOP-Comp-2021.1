
//enable sel[1] sel[2] saida
//  0      X       X     0
//  1      0       0     e0
//  1      0       1     e1
//  1      1       0     e2
//  1      1       1     e3

module MUX4_1(e0,e1,e2,e3,saida,sel,enable);

   input       e0,e1,e2,e3,enable;
   input [1:0] sel;
   output reg  saida;

   always @(*)
     begin
	if(enable==0) saida = 1'b0;
	else
	  case(sel)
	    2'b00: saida = e0;
	    2'b01: saida = e1;
	    2'b10: saida = e2;
	    2'b11: saida = e3;
	  endcase // case (sel)
     end // always @ (*)

endmodule // MUX4_1


module MUX2_1(e0,e1,sel,saida);

   input e0,e1,sel;
   output saida;
   
   assign saida = (sel)?e1:e0;

endmodule // MUX2_1
