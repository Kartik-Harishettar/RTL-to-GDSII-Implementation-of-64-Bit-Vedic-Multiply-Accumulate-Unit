`timescale 1ns/1ps

module vedicMAC64_tb;

    // Testbench signals
    reg clk;
    reg rst;
    reg enable;
    reg [63:0] a;
    reg [63:0] b;
    wire [127:0] acc;

    // DUT instantiation
    vedicMAC64 dut (
        .clk(clk),
        .rst(rst),
        .a(a),
        .b(b),
        .enable(enable),
        .acc(acc)
    );

    // Clock generation (10 ns period)
    always #5 clk = ~clk;

    initial begin
        // Initialize
        clk    = 0;
        rst    = 1;
        enable = 0;
        a      = 0;
        b      = 0;

        // Reset asserted
        #10;
        rst = 0;

        // -------- Test Case 1 --------
        enable = 1;
        a = 2;
        b = 3;        // product = 6
        #10;

        // -------- Test Case 2 --------
        a = 4;
        b = 5;        // product = 20 (acc = 6 + 20 = 26)
        #10;

        // -------- Test Case 3 --------
        a = 8;
        b = 67;       // product = 536 (acc = 26 + 536 = 562)
        #10;

        // -------- Disable accumulation --------
        enable = 0;
        a = 10;
        b = 10;       // should not change acc
        #10;

        // -------- Enable again --------
        enable = 1;
        a = 16;
        b = 16;       // product = 256
        #10;

        // -------- Reset again --------
        rst = 1;
        #10;
        rst = 0;

        // -------- Final Test --------
        a = 255;
        b = 255;      // product = 65025
        #20;

        $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time=%0t | a=%0d b=%0d enable=%b acc=%0d",
                  $time, a, b, enable, acc);
    end

endmodule

