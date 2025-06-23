`timescale 1ns / 1ps

module tb_Syn_UpCounter3bit();
   reg clk;
   reg rst;
   wire [2:0] result;
   
   Syn_UpCounter3bit uut(
      .clk(clk),
      .rst(rst),
      .result(result)
   );
   initial begin 
      clk=0;
      forever #5 clk=~clk;
   end
    
    initial begin 
        rst=1;
        #12;
        rst=0;
        #200;
        
        $finish;
    end
endmodule
