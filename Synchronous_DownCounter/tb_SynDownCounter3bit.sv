`timescale 1ns / 1ps

module tb_SynDownCounter3bit;

    reg clk;
    reg rst;
    wire [2:0] result;

    Syn_DownCounter3bit uut (
        .clk(clk),
        .rst(rst),
        .result(result)
    );
        
    initial begin
    clk=0;
    forever #5 clk = ~clk;
    end

    initial begin
    
    $display("time\t\tclk\t\trst\t\tresult");
    $monitor("%b\t%b\t%b\t%b",$time,clk,rst,result);
    
        rst = 1;
        #10;
        rst = 0;
        #200;
        $finish;
    end

endmodule
