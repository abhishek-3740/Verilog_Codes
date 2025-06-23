`timescale 1ns / 1ps
module tb_RingCounter_Nbit;
    reg clk;
    reg rst;
    wire [3:0] result;

    RingCounter_NBit #(4) uut (
        .clk(clk),
        .rst(rst),
        .result(result)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $display("Time\tclk\trst\tresult");
        $monitor("%0t\t%b\t%b\t%b", $time, clk, rst, result);

        rst = 1;
        #10;
        rst = 0;

        // wait for reset to deassert and 1 clock cycle to pass
        #5;  // mid clock
        force uut.ring_gen[0].Dff0.q = 1'b1;  // force FF q[0] = 1
        #5;   // next posedge clk
        release uut.ring_gen[0].Dff0.q;

        #100;
        $finish;
    end
endmodule
