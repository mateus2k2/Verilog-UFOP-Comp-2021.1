//Sugestão: implementar o registrador de FLAGS (ZERO,SINAL e OVERFLOW)

module soma(Va,Vb,en,result);
   
   input  [3:0] Va,Vb;
   input        en;   //sinal enable (habilitacao)
   output [4:0] result;

   reg    [4:0] result;

   always @(en)
     begin        //como esse bloco serah ativado em qualquer variacao de
	if(en)    //"en" (de 0 para 1 ou de 1 para 0, deve-se testar se o
	  begin   //"en" assumiu o valor 1 para ativar o processamento  
	     result = Va + Vb;
	  end
     end

endmodule // soma


module sub(Va,Vb,en,result);
   
   input  [3:0] Va,Vb;
   input        en;   //sinal enable (habilitacao)
   output [4:0] result;

   reg    [4:0] result;

   always @(en)
     begin
	if(en)  //vale aqui a mesma observacao feita no modulo de soma
	  begin
	     result = Va - Vb;
	  end
     end

endmodule // sub


module OpAnd(Va,Vb,en,result);
   
   input  [3:0] Va,Vb;
   input        en;   //sinal enable (habilitacao)
   output [4:0] result;

   reg    [4:0] result;

   always @(en) //vale aqui a mesma observacao feita no modulo de soma
     begin
	if(en)
	  begin
	     result = Va & Vb;
	  end
     end

endmodule // OpAnd


module OpOr(Va,Vb,en,result);

   input  [3:0] Va,Vb;
   input        en;   //sinal enable (habilitacao)
   output [4:0] result;

   reg    [4:0] result;

   always @(en)
     begin
	if(en) //vale aqui a mesma observacao feita no modulo de soma
	  begin
	     result = Va | Vb;
	  end
     end

endmodule // OpOr


module MUX_4_1(E0,E1,E2,E3,selec,s);

   input  [4:0] E0,E1,E2,E3; //entradas do MUX
   input  [1:0] selec;       //bits de selecao
   output [4:0] s;           //saida do MUX

   reg [4:0] 	s;

   always @(*)
     begin
	case(selec)
	  2'b00: s=E0;  //saida propagando a entrada E0
	  2'b01: s=E1;  //saida propagando a entrada E1
	  2'b10: s=E2;  //saida propagando a entrada E2
	  2'b11: s=E3;  //saida propagando a entrada E3
	endcase // case (selec)
     end
   
endmodule // MUX_4_1


//esse modulo de demux nao tem entrada pois tem a funcao de propagar
//o valor constante 1 para o modulo cuja operacao serah realizada no
//corrente momento
module DEMUX_1_4(selec,s0,s1,s2,s3);

   input [1:0] selec;        //bits de selecao
   output      s0,s1,s2,s3;  //saidas do DEMUX

   reg         s0,s1,s2,s3;

   always @(*)
     begin
	case(selec)
	  2'b00: {s0,s1,s2,s3}=4'b1000;  //apenas a saida s0 ativada
	  2'b01: {s0,s1,s2,s3}=4'b0100;  //apenas a saida s1 ativada
	  2'b10: {s0,s1,s2,s3}=4'b0010;  //apenas a saida s2 ativada
	  2'b11: {s0,s1,s2,s3}=4'b0001;  //apenas a saida s3 ativada
	endcase // case (selec)
     end

endmodule // DEMUX_1_4


module ALU(Ea,Eb,op,saida);

   input  [3:0] Ea,Eb;  //valores a serem processados
   input  [1:0] op;     //operacao a ser realizada
   output [4:0] saida;  //resultado da operacao

   //definicao dos fios que interligarao os submodulos
   wire 	saida0_demux,saida1_demux,saida2_demux,saida3_demux;
   wire [4:0] 	entr0_mux,entr1_mux,entr2_mux,entr3_mux;

   //instanciacao dos submodulos
   soma  m_soma (.Va(Ea),.Vb(Eb),.en(saida0_demux),.result(entr0_mux));
   sub   m_sub  (.Va(Ea),.Vb(Eb),.en(saida1_demux),.result(entr1_mux));
   OpAnd m_OpAnd(.Va(Ea),.Vb(Eb),.en(saida2_demux),.result(entr2_mux));
   OpOr  m_OpOr (.Va(Ea),.Vb(Eb),.en(saida3_demux),.result(entr3_mux));
   MUX_4_1   m4_1(.E0(entr0_mux),.E1(entr1_mux),.E2(entr2_mux),
                  .E3(entr3_mux),.selec(op),.s(saida));
   DEMUX_1_4 d1_4(.selec(op),.s0(saida0_demux),.s1(saida1_demux),
                  .s2(saida2_demux),.s3(saida3_demux));

endmodule // ALU



//modulo de simulacao - esse modulo nao eh sintetizavel - serve apenas
// para testar o codigo gerado da ALU
module simulacao;

   reg [3:0] Valor1,Valor2;  //valores a serem processados
   reg [1:0] operacao;       //operacao a ser realizada

   wire [4:0] resultado;    //resultado da operacao

   //valores iniciais, no caso: os valores a serem processados serao
   // 5 (Valor1) e 3 (Valor2); operacao = 0 (soma)
   initial
     begin
	Valor1 = 4'b0101;
	Valor2 = 4'b0011;
	operacao = 2'b00;
     end

   //como teremos 4 operacoes a serem realizadas (todas processando
   // os mesmos valores (5 e 3), entao no tempo 4 a simulacao sera
   // finalizada pois todas as operacoes serao realizadas nos tempos
   // anteriores
   initial
     begin
	#4 $stop;
     end

   //saida na tela para acompanhar os resultados da simulacao. Neste
   //caso, nao esta sendo usado o arquivo de saida da simulacao
   //(dumpfile) - pode-se incluir tambem nesta simulacao
   initial
     begin
       $display("Tempo Valor1 Valor2 oper resultado");
       $monitor("%d %d %d %b %d",$time,Valor1,Valor2,operacao,resultado);
     end
   
   //a cada ciclo da simulacao, incrementa-se 1 na "operacao" para que
   //todas as operacoes possam ser testadas
   always
     begin
	#1 operacao = operacao + 1;
     end

   //instanciacao do modulo sob teste (modulo "ALU")
   ALU ula(.Ea(Valor1),.Eb(Valor2),.op(operacao),.saida(resultado));

endmodule // simulacao
