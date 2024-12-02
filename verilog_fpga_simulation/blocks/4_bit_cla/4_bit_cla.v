`timescale 1ns/1ps

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
