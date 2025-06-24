`timescale 1ns / 1ps

module Buttonpulse(
   input clk,
   input btn_i,
   output reg out_o
    );
    reg btn_prev;
    always@(clk)begin
        btn_prev<=btn_i;
        if(btn_i==1 && btn_prev==0)begin
            out_o<=1;
        end  else begin
            out_o<=0;
        end       
    end
endmodule
