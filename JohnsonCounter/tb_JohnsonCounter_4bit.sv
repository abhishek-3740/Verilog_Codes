`timescale 1ns / 1ps
module tb_JohnsonCounter_4bit();
    reg clk;
    reg rst;
    wire [3:0]result;
    JohnsonCounter_Nbit uut (
        .clk(clk),
        .rst(rst),
        .result(result)
    );
    initial begin 
        clk=0;
        forever #5 clk= ~clk;
    end 
    initial begin 
        $display("clk\t\trst\t\tresult");
        $monitor("%b\t%b\t%b",clk,rst,result);
        
        rst=1;
        #10;
        rst=0;
        
        #200;
        $finish;
    end 
endmodule
