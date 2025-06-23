`timescale 1ns / 1ps
module up_counter_Asy(
   input clk,
   input rst,
   output [2:0]q,
   output [2:0]q_not
    );
    wire q_not0,q_not1,q_not2;
    t_ff ff0(.t(1'b1), .clk(clk), .rst(rst), .q(q0), .q_not(q_not0));
    t_ff ff1(.t(1'b1), .clk(q_not0), .rst(rst), .q(q1),.q_not(q_not1));
    t_ff ff2(.t(1'b1), .clk(q_not1), .rst(rst), .q(q2),.q_not(q_not2));
    
    assign q={q2,q1,q0};
endmodule
