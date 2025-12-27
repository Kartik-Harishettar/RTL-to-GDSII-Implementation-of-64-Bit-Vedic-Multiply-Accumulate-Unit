// 2x2 Vedic Multiplier
//=================================================================
module vedic2x2(input [1:0] a, input [1:0] b, output [3:0] p);
    wire p0, p1, p2, p3;

    assign p0 = a[0] & b[0];
    assign p1 = a[1] & b[0];
    assign p2 = a[0] & b[1];
    assign p3 = a[1] & b[1];

    assign p[0] = p0;
    assign p[1] = p1 ^ p2;
    assign p[2] = (p1 & p2) ^ p3;
    assign p[3] = (p1 & p2) & p3;
endmodule

//=================================================================
// 4x4 Vedic Multiplier
//=================================================================
module vedic4x4(input [3:0] a, input [3:0] b, output [7:0] p);
    wire [3:0] p0, p1, p2, p3;
    wire [5:0] temp1, temp2;
    wire [7:0] temp3;

    vedic2x2 m0(a[1:0], b[1:0], p0);
    vedic2x2 m1(a[3:2], b[1:0], p1);
    vedic2x2 m2(a[1:0], b[3:2], p2);
    vedic2x2 m3(a[3:2], b[3:2], p3);

    assign temp1 = {p1, 2'b00}; // shift left by 2
    assign temp2 = {p2, 2'b00}; // shift left by 2
    assign temp3 = {p3, 4'b0000}; // shift left by 4

    assign p = p0 + temp1 + temp2 + temp3;
endmodule

//=================================================================
// 8x8 Vedic Multiplier
//=================================================================
module vedic8x8(input [7:0] a, input [7:0] b, output [15:0] p);
    wire [7:0] p0, p1, p2, p3;
    wire [11:0] temp1, temp2;
    wire [15:0] temp3;

    vedic4x4 m0(a[3:0], b[3:0], p0);
    vedic4x4 m1(a[7:4], b[3:0], p1);
    vedic4x4 m2(a[3:0], b[7:4], p2);
    vedic4x4 m3(a[7:4], b[7:4], p3);

    assign temp1 = {p1, 4'b0000}; // shift left by 4
    assign temp2 = {p2, 4'b0000}; // shift left by 4
    assign temp3 = {p3, 8'b00000000}; // shift left by 8

    assign p = p0 + temp1 + temp2 + temp3;
endmodule

//=================================================================
// 16x16 Vedic Multiplier
//=================================================================
module vedic16x16(input [15:0] a, input [15:0] b, output [31:0] p);
    wire [15:0] p0, p1, p2, p3;
    wire [23:0] temp1, temp2;
    wire [31:0] temp3;

    vedic8x8 m0(a[7:0], b[7:0], p0);
    vedic8x8 m1(a[15:8], b[7:0], p1);
    vedic8x8 m2(a[7:0], b[15:8], p2);
    vedic8x8 m3(a[15:8], b[15:8], p3);

    assign temp1 = {p1, 8'b00000000}; // shift left by 8
    assign temp2 = {p2, 8'b00000000}; // shift left by 8
    assign temp3 = {p3, 16'b0000000000000000}; // shift left by 16

    assign p = p0 + temp1 + temp2 + temp3;
endmodule

//=================================================================
// 32x32 Vedic Multiplier
//=================================================================
module vedic32x32(input [31:0] a, input [31:0] b, output [63:0] p);
    wire [31:0] p0, p1, p2, p3;
    wire [47:0] temp1, temp2;
    wire [63:0] temp3;

    vedic16x16 m0(a[15:0], b[15:0], p0);
    vedic16x16 m1(a[31:16], b[15:0], p1);
    vedic16x16 m2(a[15:0], b[31:16], p2);
    vedic16x16 m3(a[31:16], b[31:16], p3);

    assign temp1 = {p1, 16'b0}; // shift left by 16
    assign temp2 = {p2, 16'b0}; // shift left by 16
    assign temp3 = {p3, 32'b0}; // shift left by 32

    assign p = p0 + temp1 + temp2 + temp3;
endmodule

//=================================================================
// 64x64 Vedic Multiplier
//=================================================================
module vedic64x64(input [63:0] a, input [63:0] b, output [127:0] p);
    wire [63:0] p0, p1, p2, p3;
    wire [79:0] temp1, temp2;
    wire [127:0] temp3;

    vedic32x32 m0(a[31:0], b[31:0], p0);
    vedic32x32 m1(a[63:32], b[31:0], p1);
    vedic32x32 m2(a[31:0], b[63:32], p2);
    vedic32x32 m3(a[63:32], b[63:32], p3);

    assign temp1 = {p1, 32'b0}; // shift left by 32
    assign temp2 = {p2, 32'b0}; // shift left by 32
    assign temp3 = {p3, 64'b0}; // shift left by 64

    assign p = p0 + temp1 + temp2 + temp3;
endmodule

//=================================================================
// 64-bit Vedic MAC (Multiply-Accumulate)
//=================================================================
module vedicMAC64(
    input clk,
    input rst,
    input [63:0] a,
    input [63:0] b,
    input enable,
    output reg [127:0] acc
);
    wire [127:0] product;

    vedic64x64 mul(a, b, product);

    always @(posedge clk) begin
        if (rst)
            acc <= 0;
        else if (enable)
            acc <= acc + product; // accumulate
    end
endmodule
