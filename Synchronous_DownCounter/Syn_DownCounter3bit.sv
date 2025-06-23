`timescale 1ns / 1ps
module Syn_DownCounter3bit(
       input clk,
       input rst,
       output [2:0] result
       
    );
    reg q0,q1,q2;
    
    t_ff tff0 (.t(1'b1),.clk(clk),.rst(rst),.q(q0),.q_not());
    t_ff tff1 (.t(~q0),.clk(clk),.rst(rst),.q(q1),.q_not());
    t_ff tff2 (.t(~q0 & ~q1),.clk(clk),.rst(rst),.q(q2),.q_not());
    
    assign result={q2,q1,q0};
    
endmodule
