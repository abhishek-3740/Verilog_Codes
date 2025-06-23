`timescale 1ns / 1ps
module DownCounter_Asy(
    input clk,
    input rst,
    output wire [2:0] q,
    output q_not
);

    wire q0, q1, q2;

    t_ff ff0(.t(1'b1), .clk(clk), .rst(rst), .q(q0), .q_not());
    t_ff ff1(.t(1'b1), .clk(q0), .rst(rst), .q(q1), .q_not());
    t_ff ff2(.t(1'b1), .clk(q1), .rst(rst), .q(q2), .q_not());

    assign q = {q2, q1, q0};

endmodule
