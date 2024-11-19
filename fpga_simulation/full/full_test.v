`timescale 1ns / 1ps

module full_test;
    reg clk;
    reg [3:0] A_in, B_in;
    reg C0_in;
    wire [3:0] S_out;
    wire C4_out;

    full uut (
        .clk(clk),
        .A_in(A_in),
        .B_in(B_in),
        .C0_in(C0_in),
        .S_out(S_out),
        .C4_out(C4_out)
    );

    initial begin
        $dumpfile("full_test.vcd");
        $dumpvars(0,full_test);
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    initial begin
        A_in = 0; B_in = 0; C0_in = 0;
        #3 A_in = 4'b1010; B_in = 4'b0111; C0_in = 1;
        #10 A_in = 4'b1100; B_in = 4'b0011; C0_in = 0;
        #10 A_in = 4'b1111; B_in = 4'b1111; C0_in = 1;
        #20 $finish;
    end

    initial begin
        $monitor("Time = %0t, A = %b, B = %b, C0 = %b, S = %b, C4 = %b",
                 $time, A_in, B_in, C0_in, S_out, C4_out);
    end
endmodule

