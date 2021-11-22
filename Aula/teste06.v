//S = (a | b&c).((a+c).b)
//s1 = (a | b&c)
//s2 = (a | c) & b
//S = s1 . s2



//parte sintetizável

//codificação estrutural
  
module Portas1(result1,a1,b1,c1);

   input  a1,b1,c1;
   output result1;
   //wire   fio;

   //assign fio = b1&c1;
   //and(fio,b1,c1);
   assign result1 = a1 | b1&c1;

endmodule // Portas1


//codificação comportamental

module Portas2(a2,b2,c2,result2);

   input a2,b2,c2;
   output reg result2;
   reg 	      reg1;
      
   always @(b2) //lista de sensibilidade - "*" -> todas as vars.  
     begin
	result2 = reg1 & b2; //"=" -> atribuição bloqueante
     end

   always @(a2 or c2)
     begin
	reg1 = a2 | c2;
     end
   
endmodule // Portas2


module Integra(a0,b0,c0,result0);

   input a0,b0,c0;
   output reg result0;
   wire   r1,r2;
   
   Portas1 p1(.c1(c0),.a1(a0),.b1(b0),.result1(r1));
   Portas2 p2(.a2(a0),.b2(b0),.c2(c0),.result2(r2));

   always @(r1 or r2)
     begin
	result0 = r1 & r2;
     end

endmodule // Integra



//módulo não sintetizável para teste

module top;

   reg a,b,c;
   wire d;

   //valores iniciais de 'a', 'b' e 'c'

   initial
     begin
	a = 0;
	b = 0;
	c = 0;
     end

   //incrementação de 'a', 'b' e 'c'

   always
     begin  
	#1 {a,b,c} = {a,b,c} + 1;
     end

   //condição de término da simulação

   initial
     begin
	#8 $stop;
     end

   //saídas da simulação

   initial
     begin
	$dumpfile("teste.dump");
	$dumpvars(0,a,b,c,d);
	$dumpon;
	$display("Tempo \t a \t b \t c \t d");
	$monitor("%0d \t %b \t %b \t %b \t %b",$time,a,b,c,d);
     end
   
   Integra integ(.a0(a),.b0(b),.c0(c),.result0(d));

endmodule // top
