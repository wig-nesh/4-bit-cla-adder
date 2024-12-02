`timescale 1ns/1ps

module d_ff_test;
    reg clk,d;
    wire q_d;
    d_ff inst1(
        .d(d),
        .clk(clk),
        .q(q_d)
    );
    initial begin
        $dumpfile("d_ff_test.vcd");
        $dumpvars(0,d_ff_test);
        clk = 1'b0;
        forever #5 clk = ~clk;
    end
    initial begin
        d = 1'b0;
        #7 d = 1'b1;
        #15 d = 1'b0;
        #7 $finish;
    end
    initial begin
        $monitor("Time=%0t | clk=%b | d=%b | q=%b", $time, clk, d, q);
    end
endmodule