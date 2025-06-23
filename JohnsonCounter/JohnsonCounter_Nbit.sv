`timescale 1ns / 1ps
module JohnsonCounter_Nbit #(parameter N = 4)(
    input clk,
    input rst,
    output [N-1:0] result
);
    wire [N-1:0] d;
    wire [N-1:0] temp_q;
    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : gen_ff
            D_ff dff (.d(d[i]),.clk(clk),.rst(rst),.q(temp_q[i]));
        end
    endgenerate

    genvar j;
    generate
        begin : gen_d_inputs
            assign d[0] = ~temp_q[N-1];  

            for (j = 1; j < N; j = j + 1) begin : assign_logic
                assign d[j] = temp_q[j - 1];
            end
        end
    endgenerate

    assign result = temp_q;
endmodule
