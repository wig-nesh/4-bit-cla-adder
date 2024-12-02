`timescale 1ns/1ps

module bit_4_cla_test;
    reg [3:0] a, b;
    reg cin;
    wire [3:0] sum;
    wire cout;

    bit_4_cla inst1(
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        $dumpfile("bit_4_cla_test.vcd");
        $dumpvars(0, bit_4_cla_test);
        
        a = 4'b0000; b = 4'b0000; cin = 1'b0;
        #2560 $finish;
    end
    always #5 a[0] = ~a[0];
    always #10 a[1] = ~a[1];
    always #20 a[2] = ~a[2];
    always #40 a[3] = ~a[3];
    always #80 b[0] = ~b[0];
    always #160 b[1] = ~b[1];
    always #320 b[2] = ~b[2];
    always #640 b[3] = ~b[3];
    always #1280 cin = ~cin;

    always @(a)
    $display("a=%b, b=%b, cin=%b, sum=%b, cout=%b", a, b, cin, sum, cout);
endmodule
