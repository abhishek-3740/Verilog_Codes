`timescale 1ns / 1ps
module tb_Buttonpulse();
    reg clk;
    reg btn_i;
    wire out_o;
    
    Buttonpulse uut (
        .clk(clk),
        .btn_i(btn_i),
        .out_o(out_o)
    );
    initial begin 
        clk=0;
        forever #5 clk=~clk;
    end 
    initial begin
        $display("clk\t\tbtn_i\t\tout_o");
        $monitor("%b\t%b\t%b",clk,btn_i,out_o);
        btn_i=1'b0;#25;
        btn_i=1'b1;#25;
        btn_i=1'b0;#45;
        btn_i=1'b1;#25;
        
        btn_i=1'b0;#45;
        btn_i=1'b1;#25;
        
        btn_i=1'b0;#45;
        btn_i=1'b1;#45;
        
        btn_i=1'b0;#25;
        btn_i=1'b1;
        $finish;
    end
endmodule
