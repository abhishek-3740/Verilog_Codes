`timescale 1ns / 1ps
module RingCounter_NBit #(parameter N = 4)(
    input clk,
    input rst,
    output [N-1:0] result
);
    wire [N-1:0] d;
    wire [N-1:0] temp_q;

    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : ring_gen
            D_ff Dff0 (
                .d(d[i]),
                .clk(clk),
                .rst(rst),
                .q(temp_q[i])
            );
            assign d[i] = (i==0) ?  temp_q[N-1] : temp_q [i-1]; 
        end
    endgenerate

    assign result = temp_q;
endmodule
