`timescale 1ns / 1ps

module tb_upCounter_Asy;

    reg clk;
    reg rst;
    wire [2:0] q;
    up_counter_Asy uut (
        .clk(clk),
        .rst(rst),
        .q(q)
    );
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1;
        #12;
        rst = 0;

        #200;

        rst = 1;
        #10;
        rst = 0;
        #100;

        $stop; 
    end

endmodule
