module aileron (angulo, v1, v2);
    // Angulação --> 4 Bits
    input [3:0] angulo;

    // Valvulas de saída --> 2 Bits, 1 bit para cada asa
    // Bit mais a esquerda --> Asa esquerda || Bit mais a direita --> Asa direita
    output reg [1:0] v1, v2;

    always @(*) begin

        if (angulo >= 4'd4 & angulo <= 4'd7) 
            begin
                v1 = 2'b01;
                v2 = 2'b01;
            end

        else if (angulo >= 4'd1 & angulo <= 4'd3) 
            begin
                v1 = 2'b01;
                v2 = 2'b00;
            end
        
        else if (angulo == 4'd0) 
            begin
                v1 = 2'b00;
                v2 = 2'b00;
            end
        
        else if (angulo >= -4'd3 & angulo <= -4'd1) 
            begin
                v1 = 2'b10;
                v2 = 2'b00;
            end
        
        else if (angulo >= -4'd7 & angulo <= -4'd4) 
            begin
                v1 = 2'b10;
                v2 = 2'b10;
            end

    end  
    
endmodule

module top;
    reg [3:0] angulo;
    wire [1:0] v1, v2;
    integer i;

    aileron ail(.angulo(angulo), .v1(v1), .v2(v2));

    initial begin
        $dumpfile("aileron.vcd");
        $dumpvars(0, top);
    end

    initial begin
        angulo = 4'b0000;
    end

    initial begin
        
        for (i=0; i<8; i = i + 1) begin
            #10 angulo = angulo + 1'b1;
        end

        angulo = 4'd0;
        for (i=0; i<8; i = i + 1) begin
            #10 angulo = angulo - 1'b1;
        end
    end

    initial begin
        #160 $stop;
    end
    
endmodule