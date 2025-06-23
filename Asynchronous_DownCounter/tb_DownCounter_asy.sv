`timescale 1ns / 1ps


module tb_DownCounter_asy();
     reg clk;
     reg rst;
     wire [2:0]q;
     wire q_not;
     
     DownCounter_Asy uut(
        .clk(clk),
        .rst(rst),
        .q(q),
        .q_not(q_not)
        );
    initial begin 
    clk=0;
    forever #5 clk= ~clk;
    end
    
    initial begin 
    rst=1; #12
    rst=0;
    #200
    rst=1; #12
    rst=0;
    #100
    $stop;
    end
endmodule
