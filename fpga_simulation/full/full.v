`timescale 1ns / 1ps

module bit_4_cla(a, b, cin, sum, cout);
    input [3:0] a, b;
    input cin;
    output [3:0] sum;
    output cout;
    wire [3:0] g, p;
    wire c1, c2, c3;

    and g0 (g[0], a[0], b[0]);
    and g1 (g[1], a[1], b[1]);
    and g2 (g[2], a[2], b[2]);
    and g3 (g[3], a[3], b[3]);

    xor p0 (p[0], a[0], b[0]);
    xor p1 (p[1], a[1], b[1]);
    xor p2 (p[2], a[2], b[2]);
    xor p3 (p[3], a[3], b[3]);

    wire temp1, temp2, temp3, temp4, temp5, temp6;

    // c1 = g0 + (p0 * cin)
    and and_c1 (temp1, p[0], cin);
    or or_c1 (c1, g[0], temp1);

    // c2 = g1 + (p1 * g0) + (p1 * p0 * cin)
    and and_c2_1 (temp2, p[1], g[0]);
    and and_c2_2 (temp3, p[1], p[0], cin);
    or or_c2 (c2, g[1], temp2, temp3);

    // c3 = g2 + (p2 * g1) + (p2 * p1 * g0) + (p2 * p1 * p0 * cin)
    and and_c3_1 (temp4, p[2], g[1]);
    and and_c3_2 (temp5, p[2], p[1], g[0]);
    and and_c3_3 (temp6, p[2], p[1], p[0], cin);
    or or_c3 (c3, g[2], temp4, temp5, temp6);

    // cout = g3 + (p3 * g2) + (p3 * p2 * g1) + (p3 * p2 * p1 * g0) + (p3 * p2 * p1 * p0 * cin)
    wire temp7, temp8, temp9, temp10;
    and and_cout_1 (temp7, p[3], g[2]);
    and and_cout_2 (temp8, p[3], p[2], g[1]);
    and and_cout_3 (temp9, p[3], p[2], p[1], g[0]);
    and and_cout_4 (temp10, p[3], p[2], p[1], p[0], cin);
    or or_cout (cout, g[3], temp7, temp8, temp9, temp10);

    xor sum0 (sum[0], p[0], cin);
    xor sum1 (sum[1], p[1], c1);
    xor sum2 (sum[2], p[2], c2);
    xor sum3 (sum[3], p[3], c3);
endmodule

module d_ff(d,clk,q);
    input d,clk;
    output reg q;
    always@(posedge clk) begin
        q <= d;
    end
endmodule

module full (
    input clk,           // Clock signal for all D flip-flops
    input [3:0] A_in,    // 4-bit input number A
    input [3:0] B_in,    // 4-bit input number B
    input C0_in,         // Carry-in
    output [3:0] S_out,  // 4-bit output sum
    output C4_out        // Carry-out
);
    // Internal signals
    wire [3:0] A_reg, B_reg; // Outputs of input D flip-flops for A and B
    wire C0_reg;             // Output of input D flip-flop for C0
    wire [3:0] S_wire;       // Outputs from the 4-bit CLA
    wire Cout_wire;          // Carry-out from the 4-bit CLA

    // 4 D flip-flops for input A
    d_ff dff_a0 (.clk(clk), .d(A_in[0]), .q(A_reg[0]));
    d_ff dff_a1 (.clk(clk), .d(A_in[1]), .q(A_reg[1]));
    d_ff dff_a2 (.clk(clk), .d(A_in[2]), .q(A_reg[2]));
    d_ff dff_a3 (.clk(clk), .d(A_in[3]), .q(A_reg[3]));

    // 4 D flip-flops for input B
    d_ff dff_b0 (.clk(clk), .d(B_in[0]), .q(B_reg[0]));
    d_ff dff_b1 (.clk(clk), .d(B_in[1]), .q(B_reg[1]));
    d_ff dff_b2 (.clk(clk), .d(B_in[2]), .q(B_reg[2]));
    d_ff dff_b3 (.clk(clk), .d(B_in[3]), .q(B_reg[3]));

    // 1 D flip-flop for input C0
    d_ff dff_c0 (.clk(clk), .d(C0_in), .q(C0_reg));

    // 4-bit Carry-Lookahead Adder
    bit_4_cla cla (
        .a(A_reg),
        .b(B_reg),
        .cin(C0_reg),
        .sum(S_wire),
        .cout(Cout_wire)
    );

    // 4 D flip-flops for output S
    d_ff dff_s0 (.clk(clk), .d(S_wire[0]), .q(S_out[0]));
    d_ff dff_s1 (.clk(clk), .d(S_wire[1]), .q(S_out[1]));
    d_ff dff_s2 (.clk(clk), .d(S_wire[2]), .q(S_out[2]));
    d_ff dff_s3 (.clk(clk), .d(S_wire[3]), .q(S_out[3]));

    // 1 D flip-flop for output C4
    d_ff dff_c4 (.clk(clk), .d(Cout_wire), .q(C4_out));

endmodule
