
module alucontrol ( alucont, aluop, funct );
  output [2:0] alucont;
  input [1:0] aluop;
  input [5:0] funct;
  wire   n8, n9, n10, n11, n12, n13, n14, n7, n15, n16, n17, n18, n19;

  INVX2 U3 ( .A(n13), .Y(alucont[0]) );
  OAI21X1 U10 ( .A(aluop[1]), .B(n19), .C(n8), .Y(alucont[2]) );
  OAI21X1 U11 ( .A(n9), .B(n10), .C(aluop[1]), .Y(n8) );
  OAI21X1 U12 ( .A(funct[2]), .B(n18), .C(n17), .Y(n10) );
  OAI21X1 U13 ( .A(n11), .B(n12), .C(aluop[1]), .Y(alucont[1]) );
  OAI21X1 U14 ( .A(funct[1]), .B(n15), .C(funct[5]), .Y(n12) );
  NAND3X1 U15 ( .A(n16), .B(n7), .C(n18), .Y(n11) );
  OAI21X1 U16 ( .A(n9), .B(n14), .C(aluop[1]), .Y(n13) );
  OAI21X1 U17 ( .A(n17), .B(n16), .C(n18), .Y(n14) );
  NAND3X1 U18 ( .A(n15), .B(n7), .C(funct[5]), .Y(n9) );
  INVX2 U4 ( .A(funct[4]), .Y(n7) );
  INVX2 U5 ( .A(funct[3]), .Y(n15) );
  INVX2 U6 ( .A(funct[2]), .Y(n16) );
  INVX2 U7 ( .A(funct[1]), .Y(n17) );
  INVX2 U8 ( .A(funct[0]), .Y(n18) );
  INVX2 U9 ( .A(aluop[0]), .Y(n19) );
endmodule


module mux2_WIDTH3 ( d0, d1, s, y );
  input [2:0] d0;
  input [2:0] d1;
  output [2:0] y;
  input s;
  wire   n5, n6, n7, n2;

  INVX2 U1 ( .A(n5), .Y(y[2]) );
  INVX2 U2 ( .A(n6), .Y(y[1]) );
  INVX2 U3 ( .A(n7), .Y(y[0]) );
  AOI22X1 U5 ( .A(d0[2]), .B(n2), .C(s), .D(d1[2]), .Y(n5) );
  AOI22X1 U6 ( .A(d0[1]), .B(n2), .C(d1[1]), .D(s), .Y(n6) );
  AOI22X1 U7 ( .A(d0[0]), .B(n2), .C(d1[0]), .D(s), .Y(n7) );
  INVX2 U4 ( .A(s), .Y(n2) );
endmodule


module mux2_WIDTH8_2 ( d0, d1, s, y );
  input [7:0] d0;
  input [7:0] d1;
  output [7:0] y;
  input s;
  wire   n10, n11, n12, n13, n14, n15, n16, n17, n2;

  INVX2 U1 ( .A(n10), .Y(y[7]) );
  INVX2 U2 ( .A(n11), .Y(y[6]) );
  INVX2 U3 ( .A(n12), .Y(y[5]) );
  INVX2 U4 ( .A(n13), .Y(y[4]) );
  INVX2 U5 ( .A(n14), .Y(y[3]) );
  INVX2 U6 ( .A(n15), .Y(y[2]) );
  INVX2 U7 ( .A(n16), .Y(y[1]) );
  INVX2 U8 ( .A(n17), .Y(y[0]) );
  AOI22X1 U10 ( .A(d0[7]), .B(n2), .C(s), .D(d1[7]), .Y(n10) );
  AOI22X1 U11 ( .A(d0[6]), .B(n2), .C(d1[6]), .D(s), .Y(n11) );
  AOI22X1 U12 ( .A(d0[5]), .B(n2), .C(d1[5]), .D(s), .Y(n12) );
  AOI22X1 U13 ( .A(d0[4]), .B(n2), .C(d1[4]), .D(s), .Y(n13) );
  AOI22X1 U14 ( .A(d0[3]), .B(n2), .C(d1[3]), .D(s), .Y(n14) );
  AOI22X1 U15 ( .A(d0[2]), .B(n2), .C(d1[2]), .D(s), .Y(n15) );
  AOI22X1 U16 ( .A(d0[1]), .B(n2), .C(d1[1]), .D(s), .Y(n16) );
  AOI22X1 U17 ( .A(d0[0]), .B(n2), .C(d1[0]), .D(s), .Y(n17) );
  INVX2 U9 ( .A(s), .Y(n2) );
endmodule


module mux2_WIDTH8_1 ( d0, d1, s, y );
  input [7:0] d0;
  input [7:0] d1;
  output [7:0] y;
  input s;
  wire   n10, n11, n12, n13, n14, n15, n16, n17, n18;

  INVX2 U1 ( .A(n10), .Y(y[7]) );
  INVX2 U2 ( .A(n11), .Y(y[6]) );
  INVX2 U3 ( .A(n12), .Y(y[5]) );
  INVX2 U4 ( .A(n13), .Y(y[4]) );
  INVX2 U5 ( .A(n14), .Y(y[3]) );
  INVX2 U6 ( .A(n15), .Y(y[2]) );
  INVX2 U7 ( .A(n16), .Y(y[1]) );
  INVX2 U8 ( .A(n17), .Y(y[0]) );
  AOI22X1 U10 ( .A(d0[7]), .B(n18), .C(s), .D(d1[7]), .Y(n10) );
  AOI22X1 U11 ( .A(d0[6]), .B(n18), .C(d1[6]), .D(s), .Y(n11) );
  AOI22X1 U12 ( .A(d0[5]), .B(n18), .C(d1[5]), .D(s), .Y(n12) );
  AOI22X1 U13 ( .A(d0[4]), .B(n18), .C(d1[4]), .D(s), .Y(n13) );
  AOI22X1 U14 ( .A(d0[3]), .B(n18), .C(d1[3]), .D(s), .Y(n14) );
  AOI22X1 U15 ( .A(d0[2]), .B(n18), .C(d1[2]), .D(s), .Y(n15) );
  AOI22X1 U16 ( .A(d0[1]), .B(n18), .C(d1[1]), .D(s), .Y(n16) );
  AOI22X1 U17 ( .A(d0[0]), .B(n18), .C(d1[0]), .D(s), .Y(n17) );
  INVX2 U9 ( .A(s), .Y(n18) );
endmodule


module mux4_WIDTH8_1 ( d0, d1, d2, d3, s, y );
  input [7:0] d0;
  input [7:0] d1;
  input [7:0] d2;
  input [7:0] d3;
  input [1:0] s;
  output [7:0] y;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22;

  AND2X2 U1 ( .A(s[0]), .B(s[1]), .Y(n5) );
  AND2X2 U2 ( .A(s[1]), .B(n22), .Y(n4) );
  NAND2X1 U4 ( .A(n2), .B(n3), .Y(y[7]) );
  AOI22X1 U5 ( .A(d2[7]), .B(n4), .C(d3[7]), .D(n5), .Y(n3) );
  AOI22X1 U6 ( .A(d0[7]), .B(n6), .C(d1[7]), .D(n7), .Y(n2) );
  NAND2X1 U7 ( .A(n8), .B(n9), .Y(y[6]) );
  AOI22X1 U8 ( .A(d2[6]), .B(n4), .C(d3[6]), .D(n5), .Y(n9) );
  AOI22X1 U9 ( .A(d0[6]), .B(n6), .C(d1[6]), .D(n7), .Y(n8) );
  NAND2X1 U10 ( .A(n10), .B(n11), .Y(y[5]) );
  AOI22X1 U11 ( .A(d2[5]), .B(n4), .C(d3[5]), .D(n5), .Y(n11) );
  AOI22X1 U12 ( .A(d0[5]), .B(n6), .C(d1[5]), .D(n7), .Y(n10) );
  NAND2X1 U13 ( .A(n12), .B(n13), .Y(y[4]) );
  AOI22X1 U14 ( .A(d2[4]), .B(n4), .C(d3[4]), .D(n5), .Y(n13) );
  AOI22X1 U15 ( .A(d0[4]), .B(n6), .C(d1[4]), .D(n7), .Y(n12) );
  NAND2X1 U16 ( .A(n14), .B(n15), .Y(y[3]) );
  AOI22X1 U17 ( .A(d2[3]), .B(n4), .C(d3[3]), .D(n5), .Y(n15) );
  AOI22X1 U18 ( .A(d0[3]), .B(n6), .C(d1[3]), .D(n7), .Y(n14) );
  NAND2X1 U19 ( .A(n16), .B(n17), .Y(y[2]) );
  AOI22X1 U20 ( .A(d2[2]), .B(n4), .C(d3[2]), .D(n5), .Y(n17) );
  AOI22X1 U21 ( .A(d0[2]), .B(n6), .C(d1[2]), .D(n7), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n19), .Y(y[1]) );
  AOI22X1 U23 ( .A(d2[1]), .B(n4), .C(d3[1]), .D(n5), .Y(n19) );
  AOI22X1 U24 ( .A(d0[1]), .B(n6), .C(d1[1]), .D(n7), .Y(n18) );
  NAND2X1 U25 ( .A(n20), .B(n21), .Y(y[0]) );
  AOI22X1 U26 ( .A(d2[0]), .B(n4), .C(d3[0]), .D(n5), .Y(n21) );
  AOI22X1 U27 ( .A(d0[0]), .B(n6), .C(d1[0]), .D(n7), .Y(n20) );
  NOR2X1 U28 ( .A(n22), .B(s[1]), .Y(n7) );
  NOR2X1 U29 ( .A(s[0]), .B(s[1]), .Y(n6) );
  INVX2 U3 ( .A(s[0]), .Y(n22) );
endmodule


module mux4_WIDTH8_0 ( d0, d1, d2, d3, s, y );
  input [7:0] d0;
  input [7:0] d1;
  input [7:0] d2;
  input [7:0] d3;
  input [1:0] s;
  output [7:0] y;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n42;

  AND2X2 U1 ( .A(s[0]), .B(s[1]), .Y(n5) );
  AND2X2 U2 ( .A(s[1]), .B(n42), .Y(n4) );
  NAND2X1 U4 ( .A(n2), .B(n3), .Y(y[7]) );
  AOI22X1 U5 ( .A(d2[7]), .B(n4), .C(d3[7]), .D(n5), .Y(n3) );
  AOI22X1 U6 ( .A(d0[7]), .B(n6), .C(d1[7]), .D(n7), .Y(n2) );
  NAND2X1 U7 ( .A(n8), .B(n9), .Y(y[6]) );
  AOI22X1 U8 ( .A(d2[6]), .B(n4), .C(d3[6]), .D(n5), .Y(n9) );
  AOI22X1 U9 ( .A(d0[6]), .B(n6), .C(d1[6]), .D(n7), .Y(n8) );
  NAND2X1 U10 ( .A(n10), .B(n11), .Y(y[5]) );
  AOI22X1 U11 ( .A(d2[5]), .B(n4), .C(d3[5]), .D(n5), .Y(n11) );
  AOI22X1 U12 ( .A(d0[5]), .B(n6), .C(d1[5]), .D(n7), .Y(n10) );
  NAND2X1 U13 ( .A(n12), .B(n13), .Y(y[4]) );
  AOI22X1 U14 ( .A(d2[4]), .B(n4), .C(d3[4]), .D(n5), .Y(n13) );
  AOI22X1 U15 ( .A(d0[4]), .B(n6), .C(d1[4]), .D(n7), .Y(n12) );
  NAND2X1 U16 ( .A(n14), .B(n15), .Y(y[3]) );
  AOI22X1 U17 ( .A(d2[3]), .B(n4), .C(d3[3]), .D(n5), .Y(n15) );
  AOI22X1 U18 ( .A(d0[3]), .B(n6), .C(d1[3]), .D(n7), .Y(n14) );
  NAND2X1 U19 ( .A(n16), .B(n17), .Y(y[2]) );
  AOI22X1 U20 ( .A(d2[2]), .B(n4), .C(d3[2]), .D(n5), .Y(n17) );
  AOI22X1 U21 ( .A(d0[2]), .B(n6), .C(d1[2]), .D(n7), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n19), .Y(y[1]) );
  AOI22X1 U23 ( .A(d2[1]), .B(n4), .C(d3[1]), .D(n5), .Y(n19) );
  AOI22X1 U24 ( .A(d0[1]), .B(n6), .C(d1[1]), .D(n7), .Y(n18) );
  NAND2X1 U25 ( .A(n20), .B(n21), .Y(y[0]) );
  AOI22X1 U26 ( .A(d2[0]), .B(n4), .C(d3[0]), .D(n5), .Y(n21) );
  AOI22X1 U27 ( .A(d0[0]), .B(n6), .C(d1[0]), .D(n7), .Y(n20) );
  NOR2X1 U28 ( .A(n42), .B(s[1]), .Y(n7) );
  NOR2X1 U29 ( .A(s[0]), .B(s[1]), .Y(n6) );
  INVX2 U3 ( .A(s[0]), .Y(n42) );
endmodule


module mux2_WIDTH8_0 ( d0, d1, s, y );
  input [7:0] d0;
  input [7:0] d1;
  output [7:0] y;
  input s;
  wire   n18, n19, n20, n21, n22, n23, n24, n25, n26;

  INVX2 U1 ( .A(n26), .Y(y[7]) );
  INVX2 U2 ( .A(n25), .Y(y[6]) );
  INVX2 U3 ( .A(n24), .Y(y[5]) );
  INVX2 U4 ( .A(n23), .Y(y[4]) );
  INVX2 U5 ( .A(n22), .Y(y[3]) );
  INVX2 U6 ( .A(n21), .Y(y[2]) );
  INVX2 U7 ( .A(n20), .Y(y[1]) );
  INVX2 U8 ( .A(n19), .Y(y[0]) );
  AOI22X1 U10 ( .A(d0[7]), .B(n18), .C(s), .D(d1[7]), .Y(n26) );
  AOI22X1 U11 ( .A(d0[6]), .B(n18), .C(d1[6]), .D(s), .Y(n25) );
  AOI22X1 U12 ( .A(d0[5]), .B(n18), .C(d1[5]), .D(s), .Y(n24) );
  AOI22X1 U13 ( .A(d0[4]), .B(n18), .C(d1[4]), .D(s), .Y(n23) );
  AOI22X1 U14 ( .A(d0[3]), .B(n18), .C(d1[3]), .D(s), .Y(n22) );
  AOI22X1 U15 ( .A(d0[2]), .B(n18), .C(d1[2]), .D(s), .Y(n21) );
  AOI22X1 U16 ( .A(d0[1]), .B(n18), .C(d1[1]), .D(s), .Y(n20) );
  AOI22X1 U17 ( .A(d0[0]), .B(n18), .C(d1[0]), .D(s), .Y(n19) );
  INVX2 U9 ( .A(s), .Y(n18) );
endmodule


module alu_WIDTH8_DW01_add_0 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;

  wire   [7:1] carry;

  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(carry[1]), .YC(carry[2]), .YS(SUM[1]) );
  FAX1 U1_0 ( .A(A[0]), .B(B[0]), .C(CI), .YC(carry[1]), .YS(SUM[0]) );
endmodule


module alu_WIDTH8 ( a, b, alucont, result );
  input [7:0] a;
  input [7:0] b;
  input [2:0] alucont;
  output [7:0] result;
  wire   n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n18, n19, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58;
  wire   [7:0] b2;
  wire   [7:0] sum;

  OAI21X1 U21 ( .A(n20), .B(n41), .C(n21), .Y(result[7]) );
  AOI22X1 U22 ( .A(b[7]), .B(n22), .C(n56), .D(a[7]), .Y(n21) );
  OAI21X1 U23 ( .A(alucont[1]), .B(n42), .C(n23), .Y(n22) );
  OAI21X1 U24 ( .A(n20), .B(n43), .C(n24), .Y(result[6]) );
  AOI22X1 U25 ( .A(b[6]), .B(n25), .C(a[6]), .D(n56), .Y(n24) );
  OAI21X1 U26 ( .A(alucont[1]), .B(n44), .C(n23), .Y(n25) );
  OAI21X1 U27 ( .A(n20), .B(n45), .C(n26), .Y(result[5]) );
  AOI22X1 U28 ( .A(b[5]), .B(n27), .C(a[5]), .D(n56), .Y(n26) );
  OAI21X1 U29 ( .A(alucont[1]), .B(n46), .C(n23), .Y(n27) );
  OAI21X1 U30 ( .A(n20), .B(n47), .C(n28), .Y(result[4]) );
  AOI22X1 U31 ( .A(b[4]), .B(n29), .C(a[4]), .D(n56), .Y(n28) );
  OAI21X1 U32 ( .A(alucont[1]), .B(n48), .C(n23), .Y(n29) );
  OAI21X1 U33 ( .A(n20), .B(n49), .C(n30), .Y(result[3]) );
  AOI22X1 U34 ( .A(b[3]), .B(n31), .C(a[3]), .D(n56), .Y(n30) );
  OAI21X1 U35 ( .A(alucont[1]), .B(n50), .C(n23), .Y(n31) );
  OAI21X1 U36 ( .A(n20), .B(n51), .C(n32), .Y(result[2]) );
  AOI22X1 U37 ( .A(b[2]), .B(n33), .C(a[2]), .D(n56), .Y(n32) );
  OAI21X1 U38 ( .A(alucont[1]), .B(n52), .C(n23), .Y(n33) );
  OAI21X1 U39 ( .A(n20), .B(n53), .C(n34), .Y(result[1]) );
  AOI22X1 U40 ( .A(b[1]), .B(n35), .C(a[1]), .D(n56), .Y(n34) );
  OAI21X1 U41 ( .A(alucont[1]), .B(n54), .C(n23), .Y(n35) );
  NAND2X1 U42 ( .A(n36), .B(n37), .Y(result[0]) );
  AOI22X1 U43 ( .A(n38), .B(sum[7]), .C(b[0]), .D(n39), .Y(n37) );
  OAI21X1 U44 ( .A(alucont[1]), .B(n55), .C(n23), .Y(n39) );
  NOR2X1 U45 ( .A(n58), .B(n18), .Y(n38) );
  AOI22X1 U46 ( .A(a[0]), .B(n56), .C(sum[0]), .D(n57), .Y(n36) );
  NAND2X1 U47 ( .A(alucont[1]), .B(n58), .Y(n20) );
  NAND2X1 U48 ( .A(alucont[0]), .B(n18), .Y(n23) );
  XOR2X1 U49 ( .A(b[7]), .B(alucont[2]), .Y(b2[7]) );
  XOR2X1 U50 ( .A(b[6]), .B(alucont[2]), .Y(b2[6]) );
  XOR2X1 U51 ( .A(b[5]), .B(alucont[2]), .Y(b2[5]) );
  XOR2X1 U52 ( .A(b[4]), .B(n40), .Y(b2[4]) );
  XOR2X1 U53 ( .A(b[3]), .B(n40), .Y(b2[3]) );
  XOR2X1 U54 ( .A(b[2]), .B(n40), .Y(b2[2]) );
  XOR2X1 U55 ( .A(b[1]), .B(n40), .Y(b2[1]) );
  XOR2X1 U56 ( .A(b[0]), .B(n40), .Y(b2[0]) );
  alu_WIDTH8_DW01_add_0 add_1_root_add_61_2 ( .A(a), .B(b2), .CI(n40), .SUM(
        sum) );
  INVX2 U2 ( .A(n19), .Y(n40) );
  INVX2 U3 ( .A(alucont[2]), .Y(n19) );
  INVX2 U4 ( .A(alucont[1]), .Y(n18) );
  INVX2 U5 ( .A(sum[7]), .Y(n41) );
  INVX2 U6 ( .A(a[7]), .Y(n42) );
  INVX2 U7 ( .A(sum[6]), .Y(n43) );
  INVX2 U8 ( .A(a[6]), .Y(n44) );
  INVX2 U9 ( .A(sum[5]), .Y(n45) );
  INVX2 U10 ( .A(a[5]), .Y(n46) );
  INVX2 U11 ( .A(sum[4]), .Y(n47) );
  INVX2 U12 ( .A(a[4]), .Y(n48) );
  INVX2 U13 ( .A(sum[3]), .Y(n49) );
  INVX2 U14 ( .A(a[3]), .Y(n50) );
  INVX2 U15 ( .A(sum[2]), .Y(n51) );
  INVX2 U16 ( .A(a[2]), .Y(n52) );
  INVX2 U17 ( .A(sum[1]), .Y(n53) );
  INVX2 U18 ( .A(a[1]), .Y(n54) );
  INVX2 U19 ( .A(a[0]), .Y(n55) );
  INVX2 U20 ( .A(n23), .Y(n56) );
  INVX2 U57 ( .A(n20), .Y(n57) );
  INVX2 U58 ( .A(alucont[0]), .Y(n58) );
endmodule


module zerodetect_WIDTH8 ( a, y );
  input [7:0] a;
  output y;
  wire   n1, n2, n3, n4, n5, n6;

  NOR2X1 U1 ( .A(n1), .B(n2), .Y(y) );
  NAND2X1 U2 ( .A(n3), .B(n4), .Y(n2) );
  NOR2X1 U3 ( .A(a[3]), .B(a[2]), .Y(n4) );
  NOR2X1 U4 ( .A(a[1]), .B(a[0]), .Y(n3) );
  NAND2X1 U5 ( .A(n5), .B(n6), .Y(n1) );
  NOR2X1 U6 ( .A(a[7]), .B(a[6]), .Y(n6) );
  NOR2X1 U7 ( .A(a[5]), .B(a[4]), .Y(n5) );
endmodule


module dff_WIDTH8_test_0 ( clk, d, q, test_si, test_se );
  input [7:0] d;
  output [7:0] q;
  input clk, test_si, test_se;


  DFFPOSX1_SCAN q_reg_7_ ( .D(d[7]), .TI(q[6]), .TE(test_se), .CLK(clk), .Q(
        q[7]) );
  DFFPOSX1_SCAN q_reg_6_ ( .D(d[6]), .TI(q[5]), .TE(test_se), .CLK(clk), .Q(
        q[6]) );
  DFFPOSX1_SCAN q_reg_5_ ( .D(d[5]), .TI(q[4]), .TE(test_se), .CLK(clk), .Q(
        q[5]) );
  DFFPOSX1_SCAN q_reg_4_ ( .D(d[4]), .TI(q[3]), .TE(test_se), .CLK(clk), .Q(
        q[4]) );
  DFFPOSX1_SCAN q_reg_3_ ( .D(d[3]), .TI(q[2]), .TE(test_se), .CLK(clk), .Q(
        q[3]) );
  DFFPOSX1_SCAN q_reg_2_ ( .D(d[2]), .TI(q[1]), .TE(test_se), .CLK(clk), .Q(
        q[2]) );
  DFFPOSX1_SCAN q_reg_1_ ( .D(d[1]), .TI(q[0]), .TE(test_se), .CLK(clk), .Q(
        q[1]) );
  DFFPOSX1_SCAN q_reg_0_ ( .D(d[0]), .TI(test_si), .TE(test_se), .CLK(clk), 
        .Q(q[0]) );
endmodule


module dffen_WIDTH8_test_0 ( clk, en, d, q, test_si, test_se );
  input [7:0] d;
  output [7:0] q;
  input clk, en, test_si, test_se;
  wire   n10, n11, n12, n13, n14, n15, n16, n17, n34, n35, n36, n37, n38, n39,
         n40, n41, n42;

  AOI22X1 U11 ( .A(en), .B(d[7]), .C(q[7]), .D(n42), .Y(n10) );
  AOI22X1 U12 ( .A(d[6]), .B(en), .C(q[6]), .D(n42), .Y(n11) );
  AOI22X1 U13 ( .A(d[5]), .B(en), .C(q[5]), .D(n42), .Y(n12) );
  AOI22X1 U14 ( .A(d[4]), .B(en), .C(q[4]), .D(n42), .Y(n13) );
  AOI22X1 U15 ( .A(d[3]), .B(en), .C(q[3]), .D(n42), .Y(n14) );
  AOI22X1 U16 ( .A(d[2]), .B(en), .C(q[2]), .D(n42), .Y(n15) );
  AOI22X1 U17 ( .A(d[1]), .B(en), .C(q[1]), .D(n42), .Y(n16) );
  AOI22X1 U18 ( .A(d[0]), .B(en), .C(q[0]), .D(n42), .Y(n17) );
  DFFPOSX1_SCAN q_reg_7_ ( .D(n34), .TI(q[6]), .TE(test_se), .CLK(clk), .Q(
        q[7]) );
  DFFPOSX1_SCAN q_reg_6_ ( .D(n35), .TI(q[5]), .TE(test_se), .CLK(clk), .Q(
        q[6]) );
  DFFPOSX1_SCAN q_reg_5_ ( .D(n36), .TI(q[4]), .TE(test_se), .CLK(clk), .Q(
        q[5]) );
  DFFPOSX1_SCAN q_reg_4_ ( .D(n37), .TI(q[3]), .TE(test_se), .CLK(clk), .Q(
        q[4]) );
  DFFPOSX1_SCAN q_reg_3_ ( .D(n38), .TI(q[2]), .TE(test_se), .CLK(clk), .Q(
        q[3]) );
  DFFPOSX1_SCAN q_reg_2_ ( .D(n39), .TI(q[1]), .TE(test_se), .CLK(clk), .Q(
        q[2]) );
  DFFPOSX1_SCAN q_reg_1_ ( .D(n40), .TI(q[0]), .TE(test_se), .CLK(clk), .Q(
        q[1]) );
  DFFPOSX1_SCAN q_reg_0_ ( .D(n41), .TI(test_si), .TE(test_se), .CLK(clk), .Q(
        q[0]) );
  INVX2 U26 ( .A(n10), .Y(n34) );
  INVX2 U27 ( .A(n11), .Y(n35) );
  INVX2 U28 ( .A(n12), .Y(n36) );
  INVX2 U29 ( .A(n13), .Y(n37) );
  INVX2 U30 ( .A(n14), .Y(n38) );
  INVX2 U31 ( .A(n15), .Y(n39) );
  INVX2 U32 ( .A(n16), .Y(n40) );
  INVX2 U33 ( .A(n17), .Y(n41) );
  INVX2 U34 ( .A(en), .Y(n42) );
endmodule


module dffen_WIDTH8_test_1 ( clk, en, d, q, test_si, test_se );
  input [7:0] d;
  output [7:0] q;
  input clk, en, test_si, test_se;
  wire   n10, n11, n12, n13, n14, n15, n16, n17, n42, n43, n44, n45, n46, n47,
         n48, n49, n50;

  AOI22X1 U11 ( .A(en), .B(d[7]), .C(q[7]), .D(n50), .Y(n10) );
  AOI22X1 U12 ( .A(d[6]), .B(en), .C(q[6]), .D(n50), .Y(n11) );
  AOI22X1 U13 ( .A(d[5]), .B(en), .C(q[5]), .D(n50), .Y(n12) );
  AOI22X1 U14 ( .A(d[4]), .B(en), .C(q[4]), .D(n50), .Y(n13) );
  AOI22X1 U15 ( .A(d[3]), .B(en), .C(q[3]), .D(n50), .Y(n14) );
  AOI22X1 U16 ( .A(d[2]), .B(en), .C(q[2]), .D(n50), .Y(n15) );
  AOI22X1 U17 ( .A(d[1]), .B(en), .C(q[1]), .D(n50), .Y(n16) );
  AOI22X1 U18 ( .A(d[0]), .B(en), .C(q[0]), .D(n50), .Y(n17) );
  DFFPOSX1_SCAN q_reg_7_ ( .D(n42), .TI(q[6]), .TE(test_se), .CLK(clk), .Q(
        q[7]) );
  DFFPOSX1_SCAN q_reg_6_ ( .D(n43), .TI(q[5]), .TE(test_se), .CLK(clk), .Q(
        q[6]) );
  DFFPOSX1_SCAN q_reg_5_ ( .D(n44), .TI(q[4]), .TE(test_se), .CLK(clk), .Q(
        q[5]) );
  DFFPOSX1_SCAN q_reg_4_ ( .D(n45), .TI(q[3]), .TE(test_se), .CLK(clk), .Q(
        q[4]) );
  DFFPOSX1_SCAN q_reg_3_ ( .D(n46), .TI(q[2]), .TE(test_se), .CLK(clk), .Q(
        q[3]) );
  DFFPOSX1_SCAN q_reg_2_ ( .D(n47), .TI(q[1]), .TE(test_se), .CLK(clk), .Q(
        q[2]) );
  DFFPOSX1_SCAN q_reg_1_ ( .D(n48), .TI(q[0]), .TE(test_se), .CLK(clk), .Q(
        q[1]) );
  DFFPOSX1_SCAN q_reg_0_ ( .D(n49), .TI(test_si), .TE(test_se), .CLK(clk), .Q(
        q[0]) );
  INVX2 U26 ( .A(n10), .Y(n42) );
  INVX2 U27 ( .A(n11), .Y(n43) );
  INVX2 U28 ( .A(n12), .Y(n44) );
  INVX2 U29 ( .A(n13), .Y(n45) );
  INVX2 U30 ( .A(n14), .Y(n46) );
  INVX2 U31 ( .A(n15), .Y(n47) );
  INVX2 U32 ( .A(n16), .Y(n48) );
  INVX2 U33 ( .A(n17), .Y(n49) );
  INVX2 U34 ( .A(en), .Y(n50) );
endmodule


module dffen_WIDTH8_test_2 ( clk, en, d, q, test_si, test_se );
  input [7:0] d;
  output [7:0] q;
  input clk, en, test_si, test_se;
  wire   n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58;

  AOI22X1 U11 ( .A(en), .B(d[7]), .C(q[7]), .D(n50), .Y(n58) );
  AOI22X1 U12 ( .A(d[6]), .B(en), .C(q[6]), .D(n50), .Y(n57) );
  AOI22X1 U13 ( .A(d[5]), .B(en), .C(q[5]), .D(n50), .Y(n56) );
  AOI22X1 U14 ( .A(d[4]), .B(en), .C(q[4]), .D(n50), .Y(n55) );
  AOI22X1 U15 ( .A(d[3]), .B(en), .C(q[3]), .D(n50), .Y(n54) );
  AOI22X1 U16 ( .A(d[2]), .B(en), .C(q[2]), .D(n50), .Y(n53) );
  AOI22X1 U17 ( .A(d[1]), .B(en), .C(q[1]), .D(n50), .Y(n52) );
  AOI22X1 U18 ( .A(d[0]), .B(en), .C(q[0]), .D(n50), .Y(n51) );
  DFFPOSX1_SCAN q_reg_7_ ( .D(n42), .TI(q[6]), .TE(test_se), .CLK(clk), .Q(
        q[7]) );
  DFFPOSX1_SCAN q_reg_6_ ( .D(n43), .TI(q[5]), .TE(test_se), .CLK(clk), .Q(
        q[6]) );
  DFFPOSX1_SCAN q_reg_5_ ( .D(n44), .TI(q[4]), .TE(test_se), .CLK(clk), .Q(
        q[5]) );
  DFFPOSX1_SCAN q_reg_4_ ( .D(n45), .TI(q[3]), .TE(test_se), .CLK(clk), .Q(
        q[4]) );
  DFFPOSX1_SCAN q_reg_3_ ( .D(n46), .TI(q[2]), .TE(test_se), .CLK(clk), .Q(
        q[3]) );
  DFFPOSX1_SCAN q_reg_2_ ( .D(n47), .TI(q[1]), .TE(test_se), .CLK(clk), .Q(
        q[2]) );
  DFFPOSX1_SCAN q_reg_1_ ( .D(n48), .TI(q[0]), .TE(test_se), .CLK(clk), .Q(
        q[1]) );
  DFFPOSX1_SCAN q_reg_0_ ( .D(n49), .TI(test_si), .TE(test_se), .CLK(clk), .Q(
        q[0]) );
  INVX2 U26 ( .A(n58), .Y(n42) );
  INVX2 U27 ( .A(n57), .Y(n43) );
  INVX2 U28 ( .A(n56), .Y(n44) );
  INVX2 U29 ( .A(n55), .Y(n45) );
  INVX2 U30 ( .A(n54), .Y(n46) );
  INVX2 U31 ( .A(n53), .Y(n47) );
  INVX2 U32 ( .A(n52), .Y(n48) );
  INVX2 U33 ( .A(n51), .Y(n49) );
  INVX2 U34 ( .A(en), .Y(n50) );
endmodule


module dffen_WIDTH8_test_3 ( clk, en, d, q, test_si, test_se );
  input [7:0] d;
  output [7:0] q;
  input clk, en, test_si, test_se;
  wire   n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58;

  AOI22X1 U11 ( .A(en), .B(d[7]), .C(q[7]), .D(n50), .Y(n58) );
  AOI22X1 U12 ( .A(d[6]), .B(en), .C(q[6]), .D(n50), .Y(n57) );
  AOI22X1 U13 ( .A(d[5]), .B(en), .C(q[5]), .D(n50), .Y(n56) );
  AOI22X1 U14 ( .A(d[4]), .B(en), .C(q[4]), .D(n50), .Y(n55) );
  AOI22X1 U15 ( .A(d[3]), .B(en), .C(q[3]), .D(n50), .Y(n54) );
  AOI22X1 U16 ( .A(d[2]), .B(en), .C(q[2]), .D(n50), .Y(n53) );
  AOI22X1 U17 ( .A(d[1]), .B(en), .C(q[1]), .D(n50), .Y(n52) );
  AOI22X1 U18 ( .A(d[0]), .B(en), .C(q[0]), .D(n50), .Y(n51) );
  DFFPOSX1_SCAN q_reg_7_ ( .D(n42), .TI(q[6]), .TE(test_se), .CLK(clk), .Q(
        q[7]) );
  DFFPOSX1_SCAN q_reg_6_ ( .D(n43), .TI(q[5]), .TE(test_se), .CLK(clk), .Q(
        q[6]) );
  DFFPOSX1_SCAN q_reg_5_ ( .D(n44), .TI(q[4]), .TE(test_se), .CLK(clk), .Q(
        q[5]) );
  DFFPOSX1_SCAN q_reg_4_ ( .D(n45), .TI(q[3]), .TE(test_se), .CLK(clk), .Q(
        q[4]) );
  DFFPOSX1_SCAN q_reg_3_ ( .D(n46), .TI(q[2]), .TE(test_se), .CLK(clk), .Q(
        q[3]) );
  DFFPOSX1_SCAN q_reg_2_ ( .D(n47), .TI(q[1]), .TE(test_se), .CLK(clk), .Q(
        q[2]) );
  DFFPOSX1_SCAN q_reg_1_ ( .D(n48), .TI(q[0]), .TE(test_se), .CLK(clk), .Q(
        q[1]) );
  DFFPOSX1_SCAN q_reg_0_ ( .D(n49), .TI(test_si), .TE(test_se), .CLK(clk), .Q(
        q[0]) );
  INVX2 U26 ( .A(n58), .Y(n42) );
  INVX2 U27 ( .A(n57), .Y(n43) );
  INVX2 U28 ( .A(n56), .Y(n44) );
  INVX2 U29 ( .A(n55), .Y(n45) );
  INVX2 U30 ( .A(n54), .Y(n46) );
  INVX2 U31 ( .A(n53), .Y(n47) );
  INVX2 U32 ( .A(n52), .Y(n48) );
  INVX2 U33 ( .A(n51), .Y(n49) );
  INVX2 U34 ( .A(en), .Y(n50) );
endmodule


module dff_WIDTH8_test_1 ( clk, d, q, test_si, test_se );
  input [7:0] d;
  output [7:0] q;
  input clk, test_si, test_se;


  DFFPOSX1_SCAN q_reg_7_ ( .D(d[7]), .TI(q[6]), .TE(test_se), .CLK(clk), .Q(
        q[7]) );
  DFFPOSX1_SCAN q_reg_6_ ( .D(d[6]), .TI(q[5]), .TE(test_se), .CLK(clk), .Q(
        q[6]) );
  DFFPOSX1_SCAN q_reg_5_ ( .D(d[5]), .TI(q[4]), .TE(test_se), .CLK(clk), .Q(
        q[5]) );
  DFFPOSX1_SCAN q_reg_4_ ( .D(d[4]), .TI(q[3]), .TE(test_se), .CLK(clk), .Q(
        q[4]) );
  DFFPOSX1_SCAN q_reg_3_ ( .D(d[3]), .TI(q[2]), .TE(test_se), .CLK(clk), .Q(
        q[3]) );
  DFFPOSX1_SCAN q_reg_2_ ( .D(d[2]), .TI(q[1]), .TE(test_se), .CLK(clk), .Q(
        q[2]) );
  DFFPOSX1_SCAN q_reg_1_ ( .D(d[1]), .TI(q[0]), .TE(test_se), .CLK(clk), .Q(
        q[1]) );
  DFFPOSX1_SCAN q_reg_0_ ( .D(d[0]), .TI(test_si), .TE(test_se), .CLK(clk), 
        .Q(q[0]) );
endmodule


module dffenr_WIDTH8_test_1 ( clk, reset, en, d, q, test_si, test_se );
  input [7:0] d;
  output [7:0] q;
  input clk, reset, en, test_si, test_se;
  wire   n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n36, n37, n38, n39,
         n40, n41, n42, n43, n44;

  AOI22X1 U12 ( .A(q[7]), .B(n11), .C(d[7]), .D(n12), .Y(n10) );
  AOI22X1 U13 ( .A(q[6]), .B(n11), .C(d[6]), .D(n12), .Y(n13) );
  AOI22X1 U14 ( .A(q[5]), .B(n11), .C(d[5]), .D(n12), .Y(n14) );
  AOI22X1 U15 ( .A(q[4]), .B(n11), .C(d[4]), .D(n12), .Y(n15) );
  AOI22X1 U16 ( .A(q[3]), .B(n11), .C(d[3]), .D(n12), .Y(n16) );
  AOI22X1 U17 ( .A(q[2]), .B(n11), .C(d[2]), .D(n12), .Y(n17) );
  AOI22X1 U18 ( .A(q[1]), .B(n11), .C(d[1]), .D(n12), .Y(n18) );
  AOI22X1 U19 ( .A(q[0]), .B(n11), .C(d[0]), .D(n12), .Y(n19) );
  NOR2X1 U20 ( .A(n12), .B(reset), .Y(n11) );
  NOR2X1 U21 ( .A(n44), .B(reset), .Y(n12) );
  DFFPOSX1_SCAN q_reg_7_ ( .D(n43), .TI(q[6]), .TE(test_se), .CLK(clk), .Q(
        q[7]) );
  DFFPOSX1_SCAN q_reg_6_ ( .D(n42), .TI(q[5]), .TE(test_se), .CLK(clk), .Q(
        q[6]) );
  DFFPOSX1_SCAN q_reg_5_ ( .D(n41), .TI(q[4]), .TE(test_se), .CLK(clk), .Q(
        q[5]) );
  DFFPOSX1_SCAN q_reg_4_ ( .D(n40), .TI(q[3]), .TE(test_se), .CLK(clk), .Q(
        q[4]) );
  DFFPOSX1_SCAN q_reg_3_ ( .D(n39), .TI(q[2]), .TE(test_se), .CLK(clk), .Q(
        q[3]) );
  DFFPOSX1_SCAN q_reg_2_ ( .D(n38), .TI(q[1]), .TE(test_se), .CLK(clk), .Q(
        q[2]) );
  DFFPOSX1_SCAN q_reg_1_ ( .D(n37), .TI(q[0]), .TE(test_se), .CLK(clk), .Q(
        q[1]) );
  DFFPOSX1_SCAN q_reg_0_ ( .D(n36), .TI(test_si), .TE(test_se), .CLK(clk), .Q(
        q[0]) );
  INVX2 U29 ( .A(n19), .Y(n36) );
  INVX2 U30 ( .A(n18), .Y(n37) );
  INVX2 U31 ( .A(n17), .Y(n38) );
  INVX2 U32 ( .A(n16), .Y(n39) );
  INVX2 U33 ( .A(n15), .Y(n40) );
  INVX2 U34 ( .A(n14), .Y(n41) );
  INVX2 U35 ( .A(n13), .Y(n42) );
  INVX2 U36 ( .A(n10), .Y(n43) );
  INVX2 U37 ( .A(en), .Y(n44) );
endmodule


module dff_WIDTH8_test_2 ( clk, d, q, test_si, test_se );
  input [7:0] d;
  output [7:0] q;
  input clk, test_si, test_se;


  DFFPOSX1_SCAN q_reg_7_ ( .D(d[7]), .TI(q[6]), .TE(test_se), .CLK(clk), .Q(
        q[7]) );
  DFFPOSX1_SCAN q_reg_6_ ( .D(d[6]), .TI(q[5]), .TE(test_se), .CLK(clk), .Q(
        q[6]) );
  DFFPOSX1_SCAN q_reg_5_ ( .D(d[5]), .TI(q[4]), .TE(test_se), .CLK(clk), .Q(
        q[5]) );
  DFFPOSX1_SCAN q_reg_4_ ( .D(d[4]), .TI(q[3]), .TE(test_se), .CLK(clk), .Q(
        q[4]) );
  DFFPOSX1_SCAN q_reg_3_ ( .D(d[3]), .TI(q[2]), .TE(test_se), .CLK(clk), .Q(
        q[3]) );
  DFFPOSX1_SCAN q_reg_2_ ( .D(d[2]), .TI(q[1]), .TE(test_se), .CLK(clk), .Q(
        q[2]) );
  DFFPOSX1_SCAN q_reg_1_ ( .D(d[1]), .TI(q[0]), .TE(test_se), .CLK(clk), .Q(
        q[1]) );
  DFFPOSX1_SCAN q_reg_0_ ( .D(d[0]), .TI(test_si), .TE(test_se), .CLK(clk), 
        .Q(q[0]) );
endmodule


module regfile_WIDTH8_REGBITS3_test_1 ( clk, regwrite, ra1, ra2, wa, wd, rd1, 
        rd2, test_si, test_so, test_se );
  input [2:0] ra1;
  input [2:0] ra2;
  input [2:0] wa;
  input [7:0] wd;
  output [7:0] rd1;
  output [7:0] rd2;
  input clk, regwrite, test_si, test_se;
  output test_so;
  wire   RAM_62_, RAM_61_, RAM_60_, RAM_59_, RAM_58_, RAM_57_, RAM_56_,
         RAM_55_, RAM_54_, RAM_53_, RAM_52_, RAM_51_, RAM_50_, RAM_49_,
         RAM_48_, RAM_47_, RAM_46_, RAM_45_, RAM_44_, RAM_43_, RAM_42_,
         RAM_41_, RAM_40_, RAM_39_, RAM_38_, RAM_37_, RAM_36_, RAM_35_,
         RAM_34_, RAM_33_, RAM_32_, RAM_31_, RAM_30_, RAM_29_, RAM_28_,
         RAM_27_, RAM_26_, RAM_25_, RAM_24_, RAM_23_, RAM_22_, RAM_21_,
         RAM_20_, RAM_19_, RAM_18_, RAM_17_, RAM_16_, RAM_15_, RAM_14_,
         RAM_13_, RAM_12_, RAM_11_, RAM_10_, RAM_9_, RAM_8_, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n130,
         n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
         n142, n143, n144, n145, n146, n147, n148, n149, n150, n151, n152,
         n153, n79, n80, n81, n82, n84, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n122, n123, n124, n125, n126, n127, n128, n129,
         n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n176,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n303, n304, n305, n418, n419, n420, n421, n422,
         n423, n424, n425, n426, n427, n428, n429, n430, n431, n432, n433,
         n434, n435, n436, n437, n438, n439, n440, n441, n442, n443, n444,
         n445, n446, n447, n448, n449, n450, n451, n452, n453, n454, n455,
         n456, n457, n458, n459, n460, n461, n462, n463, n464, n465, n466,
         n467, n468, n469, n470, n471, n472, n473, n474, n475, n476, n477,
         n478, n479, n480, n481, n482, n483, n484, n485, n486, n487, n488,
         n489;

  AND2X2 U2 ( .A(wa[2]), .B(regwrite), .Y(n218) );
  OAI21X1 U81 ( .A(ra2[0]), .B(n79), .C(n80), .Y(rd2[7]) );
  OAI21X1 U82 ( .A(n81), .B(n82), .C(n293), .Y(n80) );
  OAI22X1 U83 ( .A(n436), .B(n457), .C(n304), .D(n441), .Y(n82) );
  OAI22X1 U84 ( .A(n84), .B(n481), .C(n305), .D(n465), .Y(n81) );
  AOI21X1 U85 ( .A(RAM_39_), .B(n86), .C(n87), .Y(n79) );
  OAI22X1 U86 ( .A(n304), .B(n449), .C(n305), .D(n473), .Y(n87) );
  OAI21X1 U87 ( .A(n293), .B(n88), .C(n89), .Y(rd2[6]) );
  OAI21X1 U88 ( .A(n90), .B(n91), .C(n293), .Y(n89) );
  OAI22X1 U89 ( .A(n436), .B(n458), .C(n304), .D(n442), .Y(n91) );
  OAI22X1 U90 ( .A(n84), .B(n482), .C(n305), .D(n466), .Y(n90) );
  AOI21X1 U91 ( .A(RAM_38_), .B(n86), .C(n92), .Y(n88) );
  OAI22X1 U92 ( .A(n304), .B(n450), .C(n305), .D(n474), .Y(n92) );
  OAI21X1 U93 ( .A(ra2[0]), .B(n93), .C(n94), .Y(rd2[5]) );
  OAI21X1 U94 ( .A(n95), .B(n96), .C(n293), .Y(n94) );
  OAI22X1 U95 ( .A(n436), .B(n459), .C(n304), .D(n443), .Y(n96) );
  OAI22X1 U96 ( .A(n84), .B(n483), .C(n305), .D(n467), .Y(n95) );
  AOI21X1 U97 ( .A(RAM_37_), .B(n86), .C(n97), .Y(n93) );
  OAI22X1 U98 ( .A(n304), .B(n451), .C(n305), .D(n475), .Y(n97) );
  OAI21X1 U99 ( .A(n293), .B(n122), .C(n123), .Y(rd2[4]) );
  OAI21X1 U100 ( .A(n124), .B(n125), .C(n293), .Y(n123) );
  OAI22X1 U101 ( .A(n436), .B(n460), .C(n304), .D(n444), .Y(n125) );
  OAI22X1 U102 ( .A(n84), .B(n484), .C(n305), .D(n468), .Y(n124) );
  AOI21X1 U103 ( .A(RAM_36_), .B(n86), .C(n126), .Y(n122) );
  OAI22X1 U104 ( .A(n304), .B(n452), .C(n305), .D(n476), .Y(n126) );
  OAI21X1 U105 ( .A(ra2[0]), .B(n127), .C(n128), .Y(rd2[3]) );
  OAI21X1 U106 ( .A(n129), .B(n154), .C(ra2[0]), .Y(n128) );
  OAI22X1 U107 ( .A(n436), .B(n461), .C(n304), .D(n445), .Y(n154) );
  OAI22X1 U108 ( .A(n84), .B(n485), .C(n305), .D(n469), .Y(n129) );
  AOI21X1 U109 ( .A(RAM_35_), .B(n86), .C(n155), .Y(n127) );
  OAI22X1 U110 ( .A(n304), .B(n453), .C(n305), .D(n477), .Y(n155) );
  OAI21X1 U111 ( .A(n293), .B(n156), .C(n157), .Y(rd2[2]) );
  OAI21X1 U112 ( .A(n158), .B(n159), .C(n293), .Y(n157) );
  OAI22X1 U113 ( .A(n436), .B(n462), .C(n304), .D(n446), .Y(n159) );
  OAI22X1 U114 ( .A(n84), .B(n486), .C(n305), .D(n470), .Y(n158) );
  AOI21X1 U115 ( .A(RAM_34_), .B(n86), .C(n160), .Y(n156) );
  OAI22X1 U116 ( .A(n304), .B(n454), .C(n305), .D(n478), .Y(n160) );
  OAI21X1 U117 ( .A(ra2[0]), .B(n161), .C(n162), .Y(rd2[1]) );
  OAI21X1 U118 ( .A(n163), .B(n164), .C(ra2[0]), .Y(n162) );
  OAI22X1 U119 ( .A(n436), .B(n463), .C(n304), .D(n447), .Y(n164) );
  OAI22X1 U120 ( .A(n84), .B(n487), .C(n305), .D(n471), .Y(n163) );
  AOI21X1 U121 ( .A(RAM_33_), .B(n86), .C(n165), .Y(n161) );
  OAI22X1 U122 ( .A(n304), .B(n455), .C(n305), .D(n479), .Y(n165) );
  OAI21X1 U123 ( .A(n293), .B(n166), .C(n167), .Y(rd2[0]) );
  OAI21X1 U124 ( .A(n168), .B(n169), .C(n293), .Y(n167) );
  OAI22X1 U125 ( .A(n436), .B(n464), .C(n304), .D(n448), .Y(n169) );
  OAI22X1 U126 ( .A(n84), .B(n488), .C(n305), .D(n472), .Y(n168) );
  OR2X1 U127 ( .A(ra2[2]), .B(ra2[1]), .Y(n84) );
  AOI21X1 U128 ( .A(RAM_32_), .B(n86), .C(n170), .Y(n166) );
  OAI22X1 U129 ( .A(n304), .B(n456), .C(n305), .D(n480), .Y(n170) );
  NOR2X1 U132 ( .A(n437), .B(ra2[1]), .Y(n86) );
  OAI21X1 U133 ( .A(ra1[0]), .B(n171), .C(n172), .Y(rd1[7]) );
  OAI21X1 U134 ( .A(n173), .B(n174), .C(n295), .Y(n172) );
  OAI22X1 U135 ( .A(n457), .B(n434), .C(n441), .D(n302), .Y(n174) );
  OAI22X1 U136 ( .A(n481), .B(n176), .C(n465), .D(n303), .Y(n173) );
  AOI21X1 U137 ( .A(n178), .B(RAM_39_), .C(n179), .Y(n171) );
  OAI22X1 U138 ( .A(n449), .B(n302), .C(n473), .D(n303), .Y(n179) );
  OAI21X1 U139 ( .A(n295), .B(n180), .C(n181), .Y(rd1[6]) );
  OAI21X1 U140 ( .A(n182), .B(n183), .C(n295), .Y(n181) );
  OAI22X1 U141 ( .A(n458), .B(n434), .C(n442), .D(n302), .Y(n183) );
  OAI22X1 U142 ( .A(n482), .B(n176), .C(n466), .D(n303), .Y(n182) );
  AOI21X1 U143 ( .A(n178), .B(RAM_38_), .C(n184), .Y(n180) );
  OAI22X1 U144 ( .A(n450), .B(n302), .C(n474), .D(n303), .Y(n184) );
  OAI21X1 U145 ( .A(ra1[0]), .B(n185), .C(n186), .Y(rd1[5]) );
  OAI21X1 U146 ( .A(n187), .B(n188), .C(n295), .Y(n186) );
  OAI22X1 U147 ( .A(n459), .B(n434), .C(n443), .D(n302), .Y(n188) );
  OAI22X1 U148 ( .A(n483), .B(n176), .C(n467), .D(n303), .Y(n187) );
  AOI21X1 U149 ( .A(n178), .B(RAM_37_), .C(n189), .Y(n185) );
  OAI22X1 U150 ( .A(n451), .B(n302), .C(n475), .D(n303), .Y(n189) );
  OAI21X1 U151 ( .A(n295), .B(n190), .C(n191), .Y(rd1[4]) );
  OAI21X1 U152 ( .A(n192), .B(n193), .C(n295), .Y(n191) );
  OAI22X1 U153 ( .A(n460), .B(n434), .C(n444), .D(n302), .Y(n193) );
  OAI22X1 U154 ( .A(n484), .B(n176), .C(n468), .D(n303), .Y(n192) );
  AOI21X1 U155 ( .A(n178), .B(RAM_36_), .C(n194), .Y(n190) );
  OAI22X1 U156 ( .A(n452), .B(n302), .C(n476), .D(n303), .Y(n194) );
  OAI21X1 U157 ( .A(ra1[0]), .B(n195), .C(n196), .Y(rd1[3]) );
  OAI21X1 U158 ( .A(n197), .B(n198), .C(ra1[0]), .Y(n196) );
  OAI22X1 U159 ( .A(n461), .B(n434), .C(n445), .D(n302), .Y(n198) );
  OAI22X1 U160 ( .A(n485), .B(n176), .C(n469), .D(n303), .Y(n197) );
  AOI21X1 U161 ( .A(n178), .B(RAM_35_), .C(n199), .Y(n195) );
  OAI22X1 U162 ( .A(n453), .B(n302), .C(n477), .D(n303), .Y(n199) );
  OAI21X1 U163 ( .A(n295), .B(n200), .C(n201), .Y(rd1[2]) );
  OAI21X1 U164 ( .A(n202), .B(n203), .C(n295), .Y(n201) );
  OAI22X1 U165 ( .A(n462), .B(n434), .C(n446), .D(n302), .Y(n203) );
  OAI22X1 U166 ( .A(n486), .B(n176), .C(n470), .D(n303), .Y(n202) );
  AOI21X1 U167 ( .A(n178), .B(RAM_34_), .C(n204), .Y(n200) );
  OAI22X1 U168 ( .A(n454), .B(n302), .C(n478), .D(n303), .Y(n204) );
  OAI21X1 U169 ( .A(ra1[0]), .B(n205), .C(n206), .Y(rd1[1]) );
  OAI21X1 U170 ( .A(n207), .B(n208), .C(ra1[0]), .Y(n206) );
  OAI22X1 U171 ( .A(n463), .B(n434), .C(n447), .D(n302), .Y(n208) );
  OAI22X1 U172 ( .A(n487), .B(n176), .C(n471), .D(n303), .Y(n207) );
  AOI21X1 U173 ( .A(n178), .B(RAM_33_), .C(n209), .Y(n205) );
  OAI22X1 U174 ( .A(n455), .B(n302), .C(n479), .D(n303), .Y(n209) );
  OAI21X1 U175 ( .A(n295), .B(n210), .C(n211), .Y(rd1[0]) );
  OAI21X1 U176 ( .A(n212), .B(n213), .C(n295), .Y(n211) );
  OAI22X1 U177 ( .A(n464), .B(n434), .C(n448), .D(n302), .Y(n213) );
  OAI22X1 U178 ( .A(n488), .B(n176), .C(n472), .D(n303), .Y(n212) );
  OR2X1 U179 ( .A(ra1[2]), .B(ra1[1]), .Y(n176) );
  AOI21X1 U180 ( .A(n178), .B(RAM_32_), .C(n214), .Y(n210) );
  OAI22X1 U181 ( .A(n456), .B(n302), .C(n480), .D(n303), .Y(n214) );
  NOR2X1 U184 ( .A(n435), .B(ra1[1]), .Y(n178) );
  OAI22X1 U185 ( .A(n296), .B(n487), .C(n215), .D(n430), .Y(n99) );
  OAI22X1 U186 ( .A(n296), .B(n488), .C(n215), .D(n432), .Y(n98) );
  OAI22X1 U187 ( .A(n301), .B(n441), .C(n418), .D(n217), .Y(n153) );
  OAI22X1 U188 ( .A(n301), .B(n442), .C(n420), .D(n217), .Y(n152) );
  OAI22X1 U189 ( .A(n301), .B(n443), .C(n422), .D(n217), .Y(n151) );
  OAI22X1 U190 ( .A(n301), .B(n444), .C(n424), .D(n217), .Y(n150) );
  OAI22X1 U191 ( .A(n301), .B(n445), .C(n426), .D(n217), .Y(n149) );
  OAI22X1 U192 ( .A(n301), .B(n446), .C(n428), .D(n217), .Y(n148) );
  OAI22X1 U193 ( .A(n301), .B(n447), .C(n430), .D(n217), .Y(n147) );
  OAI22X1 U194 ( .A(n301), .B(n448), .C(n432), .D(n217), .Y(n146) );
  NAND3X1 U195 ( .A(n218), .B(wa[0]), .C(wa[1]), .Y(n217) );
  OAI22X1 U196 ( .A(n300), .B(n449), .C(n418), .D(n219), .Y(n145) );
  OAI22X1 U197 ( .A(n300), .B(n450), .C(n420), .D(n219), .Y(n144) );
  OAI22X1 U198 ( .A(n300), .B(n451), .C(n422), .D(n219), .Y(n143) );
  OAI22X1 U199 ( .A(n300), .B(n452), .C(n424), .D(n219), .Y(n142) );
  OAI22X1 U200 ( .A(n300), .B(n453), .C(n426), .D(n219), .Y(n141) );
  OAI22X1 U201 ( .A(n300), .B(n454), .C(n428), .D(n219), .Y(n140) );
  OAI22X1 U202 ( .A(n300), .B(n455), .C(n430), .D(n219), .Y(n139) );
  OAI22X1 U203 ( .A(n300), .B(n456), .C(n432), .D(n219), .Y(n138) );
  NAND3X1 U204 ( .A(n218), .B(n440), .C(wa[1]), .Y(n219) );
  OAI22X1 U205 ( .A(n299), .B(n457), .C(n418), .D(n220), .Y(n137) );
  OAI22X1 U206 ( .A(n299), .B(n458), .C(n420), .D(n220), .Y(n136) );
  OAI22X1 U207 ( .A(n299), .B(n459), .C(n422), .D(n220), .Y(n135) );
  OAI22X1 U208 ( .A(n299), .B(n460), .C(n424), .D(n220), .Y(n134) );
  OAI22X1 U209 ( .A(n299), .B(n461), .C(n426), .D(n220), .Y(n133) );
  OAI22X1 U210 ( .A(n299), .B(n462), .C(n428), .D(n220), .Y(n132) );
  OAI22X1 U211 ( .A(n299), .B(n463), .C(n430), .D(n220), .Y(n131) );
  OAI22X1 U212 ( .A(n299), .B(n464), .C(n432), .D(n220), .Y(n130) );
  NAND3X1 U213 ( .A(wa[0]), .B(n439), .C(n218), .Y(n220) );
  AOI22X1 U214 ( .A(n222), .B(RAM_39_), .C(wd[7]), .D(n298), .Y(n221) );
  AOI22X1 U215 ( .A(n222), .B(RAM_38_), .C(wd[6]), .D(n298), .Y(n223) );
  AOI22X1 U216 ( .A(n222), .B(RAM_37_), .C(wd[5]), .D(n298), .Y(n224) );
  AOI22X1 U217 ( .A(n222), .B(RAM_36_), .C(wd[4]), .D(n298), .Y(n225) );
  AOI22X1 U218 ( .A(n222), .B(RAM_35_), .C(wd[3]), .D(n298), .Y(n226) );
  AOI22X1 U219 ( .A(n222), .B(RAM_34_), .C(wd[2]), .D(n298), .Y(n227) );
  AOI22X1 U220 ( .A(n222), .B(RAM_33_), .C(wd[1]), .D(n298), .Y(n228) );
  AOI22X1 U221 ( .A(n222), .B(RAM_32_), .C(wd[0]), .D(n298), .Y(n229) );
  NAND3X1 U222 ( .A(n440), .B(n439), .C(n218), .Y(n222) );
  OAI22X1 U223 ( .A(n297), .B(n465), .C(n418), .D(n230), .Y(n121) );
  OAI22X1 U224 ( .A(n297), .B(n466), .C(n420), .D(n230), .Y(n120) );
  OAI22X1 U225 ( .A(n297), .B(n467), .C(n422), .D(n230), .Y(n119) );
  OAI22X1 U226 ( .A(n297), .B(n468), .C(n424), .D(n230), .Y(n118) );
  OAI22X1 U227 ( .A(n297), .B(n469), .C(n426), .D(n230), .Y(n117) );
  OAI22X1 U228 ( .A(n297), .B(n470), .C(n428), .D(n230), .Y(n116) );
  OAI22X1 U229 ( .A(n297), .B(n471), .C(n430), .D(n230), .Y(n115) );
  OAI22X1 U230 ( .A(n297), .B(n472), .C(n432), .D(n230), .Y(n114) );
  NAND3X1 U231 ( .A(wa[0]), .B(n216), .C(wa[1]), .Y(n230) );
  OAI22X1 U232 ( .A(n438), .B(n473), .C(n418), .D(n231), .Y(n113) );
  OAI22X1 U233 ( .A(n438), .B(n474), .C(n420), .D(n231), .Y(n112) );
  OAI22X1 U234 ( .A(n438), .B(n475), .C(n422), .D(n231), .Y(n111) );
  OAI22X1 U235 ( .A(n438), .B(n476), .C(n424), .D(n231), .Y(n110) );
  OAI22X1 U236 ( .A(n438), .B(n477), .C(n426), .D(n231), .Y(n109) );
  OAI22X1 U237 ( .A(n438), .B(n478), .C(n428), .D(n231), .Y(n108) );
  OAI22X1 U238 ( .A(n438), .B(n479), .C(n430), .D(n231), .Y(n107) );
  OAI22X1 U239 ( .A(n438), .B(n480), .C(n432), .D(n231), .Y(n106) );
  NAND3X1 U240 ( .A(n216), .B(n440), .C(wa[1]), .Y(n231) );
  OAI22X1 U241 ( .A(n296), .B(n481), .C(n215), .D(n418), .Y(n105) );
  OAI22X1 U242 ( .A(n296), .B(n482), .C(n215), .D(n420), .Y(n104) );
  OAI22X1 U243 ( .A(n296), .B(n483), .C(n215), .D(n422), .Y(n103) );
  OAI22X1 U244 ( .A(n296), .B(n484), .C(n215), .D(n424), .Y(n102) );
  OAI22X1 U245 ( .A(n296), .B(n485), .C(n215), .D(n426), .Y(n101) );
  OAI22X1 U246 ( .A(n296), .B(n486), .C(n215), .D(n428), .Y(n100) );
  NAND3X1 U247 ( .A(n216), .B(n439), .C(wa[0]), .Y(n215) );
  NOR2X1 U248 ( .A(n489), .B(wa[2]), .Y(n216) );
  DFFPOSX1_SCAN RAM_reg_7__7_ ( .D(n153), .TI(RAM_62_), .TE(test_se), .CLK(clk), .Q(test_so) );
  DFFPOSX1_SCAN RAM_reg_7__6_ ( .D(n152), .TI(RAM_61_), .TE(test_se), .CLK(clk), .Q(RAM_62_) );
  DFFPOSX1_SCAN RAM_reg_7__5_ ( .D(n151), .TI(RAM_60_), .TE(test_se), .CLK(clk), .Q(RAM_61_) );
  DFFPOSX1_SCAN RAM_reg_7__4_ ( .D(n150), .TI(RAM_59_), .TE(test_se), .CLK(clk), .Q(RAM_60_) );
  DFFPOSX1_SCAN RAM_reg_7__3_ ( .D(n149), .TI(RAM_58_), .TE(test_se), .CLK(clk), .Q(RAM_59_) );
  DFFPOSX1_SCAN RAM_reg_7__2_ ( .D(n148), .TI(RAM_57_), .TE(test_se), .CLK(clk), .Q(RAM_58_) );
  DFFPOSX1_SCAN RAM_reg_7__1_ ( .D(n147), .TI(RAM_56_), .TE(test_se), .CLK(clk), .Q(RAM_57_) );
  DFFPOSX1_SCAN RAM_reg_7__0_ ( .D(n146), .TI(RAM_55_), .TE(test_se), .CLK(clk), .Q(RAM_56_) );
  DFFPOSX1_SCAN RAM_reg_6__7_ ( .D(n145), .TI(RAM_54_), .TE(test_se), .CLK(clk), .Q(RAM_55_) );
  DFFPOSX1_SCAN RAM_reg_6__6_ ( .D(n144), .TI(RAM_53_), .TE(test_se), .CLK(clk), .Q(RAM_54_) );
  DFFPOSX1_SCAN RAM_reg_6__5_ ( .D(n143), .TI(RAM_52_), .TE(test_se), .CLK(clk), .Q(RAM_53_) );
  DFFPOSX1_SCAN RAM_reg_6__4_ ( .D(n142), .TI(RAM_51_), .TE(test_se), .CLK(clk), .Q(RAM_52_) );
  DFFPOSX1_SCAN RAM_reg_6__3_ ( .D(n141), .TI(RAM_50_), .TE(test_se), .CLK(clk), .Q(RAM_51_) );
  DFFPOSX1_SCAN RAM_reg_6__2_ ( .D(n140), .TI(RAM_49_), .TE(test_se), .CLK(clk), .Q(RAM_50_) );
  DFFPOSX1_SCAN RAM_reg_6__1_ ( .D(n139), .TI(RAM_48_), .TE(test_se), .CLK(clk), .Q(RAM_49_) );
  DFFPOSX1_SCAN RAM_reg_6__0_ ( .D(n138), .TI(RAM_47_), .TE(test_se), .CLK(clk), .Q(RAM_48_) );
  DFFPOSX1_SCAN RAM_reg_5__7_ ( .D(n137), .TI(RAM_46_), .TE(test_se), .CLK(clk), .Q(RAM_47_) );
  DFFPOSX1_SCAN RAM_reg_5__6_ ( .D(n136), .TI(RAM_45_), .TE(test_se), .CLK(clk), .Q(RAM_46_) );
  DFFPOSX1_SCAN RAM_reg_5__5_ ( .D(n135), .TI(RAM_44_), .TE(test_se), .CLK(clk), .Q(RAM_45_) );
  DFFPOSX1_SCAN RAM_reg_5__4_ ( .D(n134), .TI(RAM_43_), .TE(test_se), .CLK(clk), .Q(RAM_44_) );
  DFFPOSX1_SCAN RAM_reg_5__3_ ( .D(n133), .TI(RAM_42_), .TE(test_se), .CLK(clk), .Q(RAM_43_) );
  DFFPOSX1_SCAN RAM_reg_5__2_ ( .D(n132), .TI(RAM_41_), .TE(test_se), .CLK(clk), .Q(RAM_42_) );
  DFFPOSX1_SCAN RAM_reg_5__1_ ( .D(n131), .TI(RAM_40_), .TE(test_se), .CLK(clk), .Q(RAM_41_) );
  DFFPOSX1_SCAN RAM_reg_5__0_ ( .D(n130), .TI(RAM_39_), .TE(test_se), .CLK(clk), .Q(RAM_40_) );
  DFFPOSX1_SCAN RAM_reg_4__7_ ( .D(n419), .TI(RAM_38_), .TE(test_se), .CLK(clk), .Q(RAM_39_) );
  DFFPOSX1_SCAN RAM_reg_4__6_ ( .D(n421), .TI(RAM_37_), .TE(test_se), .CLK(clk), .Q(RAM_38_) );
  DFFPOSX1_SCAN RAM_reg_4__5_ ( .D(n423), .TI(RAM_36_), .TE(test_se), .CLK(clk), .Q(RAM_37_) );
  DFFPOSX1_SCAN RAM_reg_4__4_ ( .D(n425), .TI(RAM_35_), .TE(test_se), .CLK(clk), .Q(RAM_36_) );
  DFFPOSX1_SCAN RAM_reg_4__3_ ( .D(n427), .TI(RAM_34_), .TE(test_se), .CLK(clk), .Q(RAM_35_) );
  DFFPOSX1_SCAN RAM_reg_4__2_ ( .D(n429), .TI(RAM_33_), .TE(test_se), .CLK(clk), .Q(RAM_34_) );
  DFFPOSX1_SCAN RAM_reg_4__1_ ( .D(n431), .TI(RAM_32_), .TE(test_se), .CLK(clk), .Q(RAM_33_) );
  DFFPOSX1_SCAN RAM_reg_4__0_ ( .D(n433), .TI(RAM_31_), .TE(test_se), .CLK(clk), .Q(RAM_32_) );
  DFFPOSX1_SCAN RAM_reg_3__7_ ( .D(n121), .TI(RAM_30_), .TE(test_se), .CLK(clk), .Q(RAM_31_) );
  DFFPOSX1_SCAN RAM_reg_3__6_ ( .D(n120), .TI(RAM_29_), .TE(test_se), .CLK(clk), .Q(RAM_30_) );
  DFFPOSX1_SCAN RAM_reg_3__5_ ( .D(n119), .TI(RAM_28_), .TE(test_se), .CLK(clk), .Q(RAM_29_) );
  DFFPOSX1_SCAN RAM_reg_3__4_ ( .D(n118), .TI(RAM_27_), .TE(test_se), .CLK(clk), .Q(RAM_28_) );
  DFFPOSX1_SCAN RAM_reg_3__3_ ( .D(n117), .TI(RAM_26_), .TE(test_se), .CLK(clk), .Q(RAM_27_) );
  DFFPOSX1_SCAN RAM_reg_3__2_ ( .D(n116), .TI(RAM_25_), .TE(test_se), .CLK(clk), .Q(RAM_26_) );
  DFFPOSX1_SCAN RAM_reg_3__1_ ( .D(n115), .TI(RAM_24_), .TE(test_se), .CLK(clk), .Q(RAM_25_) );
  DFFPOSX1_SCAN RAM_reg_3__0_ ( .D(n114), .TI(RAM_23_), .TE(test_se), .CLK(clk), .Q(RAM_24_) );
  DFFPOSX1_SCAN RAM_reg_2__7_ ( .D(n113), .TI(RAM_22_), .TE(test_se), .CLK(clk), .Q(RAM_23_) );
  DFFPOSX1_SCAN RAM_reg_2__6_ ( .D(n112), .TI(RAM_21_), .TE(test_se), .CLK(clk), .Q(RAM_22_) );
  DFFPOSX1_SCAN RAM_reg_2__5_ ( .D(n111), .TI(RAM_20_), .TE(test_se), .CLK(clk), .Q(RAM_21_) );
  DFFPOSX1_SCAN RAM_reg_2__4_ ( .D(n110), .TI(RAM_19_), .TE(test_se), .CLK(clk), .Q(RAM_20_) );
  DFFPOSX1_SCAN RAM_reg_2__3_ ( .D(n109), .TI(RAM_18_), .TE(test_se), .CLK(clk), .Q(RAM_19_) );
  DFFPOSX1_SCAN RAM_reg_2__2_ ( .D(n108), .TI(RAM_17_), .TE(test_se), .CLK(clk), .Q(RAM_18_) );
  DFFPOSX1_SCAN RAM_reg_2__1_ ( .D(n107), .TI(RAM_16_), .TE(test_se), .CLK(clk), .Q(RAM_17_) );
  DFFPOSX1_SCAN RAM_reg_2__0_ ( .D(n106), .TI(RAM_15_), .TE(test_se), .CLK(clk), .Q(RAM_16_) );
  DFFPOSX1_SCAN RAM_reg_1__7_ ( .D(n105), .TI(RAM_14_), .TE(test_se), .CLK(clk), .Q(RAM_15_) );
  DFFPOSX1_SCAN RAM_reg_1__6_ ( .D(n104), .TI(RAM_13_), .TE(test_se), .CLK(clk), .Q(RAM_14_) );
  DFFPOSX1_SCAN RAM_reg_1__5_ ( .D(n103), .TI(RAM_12_), .TE(test_se), .CLK(clk), .Q(RAM_13_) );
  DFFPOSX1_SCAN RAM_reg_1__4_ ( .D(n102), .TI(RAM_11_), .TE(test_se), .CLK(clk), .Q(RAM_12_) );
  DFFPOSX1_SCAN RAM_reg_1__3_ ( .D(n101), .TI(RAM_10_), .TE(test_se), .CLK(clk), .Q(RAM_11_) );
  DFFPOSX1_SCAN RAM_reg_1__2_ ( .D(n100), .TI(RAM_9_), .TE(test_se), .CLK(clk), 
        .Q(RAM_10_) );
  DFFPOSX1_SCAN RAM_reg_1__1_ ( .D(n99), .TI(RAM_8_), .TE(test_se), .CLK(clk), 
        .Q(RAM_9_) );
  DFFPOSX1_SCAN RAM_reg_1__0_ ( .D(n98), .TI(test_si), .TE(test_se), .CLK(clk), 
        .Q(RAM_8_) );
  INVX2 U3 ( .A(n222), .Y(n298) );
  INVX2 U4 ( .A(n219), .Y(n300) );
  INVX2 U5 ( .A(n230), .Y(n297) );
  INVX2 U6 ( .A(n215), .Y(n296) );
  INVX2 U7 ( .A(n220), .Y(n299) );
  INVX2 U8 ( .A(n217), .Y(n301) );
  INVX2 U9 ( .A(n290), .Y(n303) );
  INVX2 U10 ( .A(n291), .Y(n302) );
  INVX2 U11 ( .A(n288), .Y(n305) );
  INVX2 U12 ( .A(n289), .Y(n304) );
  INVX2 U13 ( .A(n292), .Y(n293) );
  INVX2 U14 ( .A(n294), .Y(n295) );
  AND2X2 U15 ( .A(ra2[1]), .B(n437), .Y(n288) );
  INVX2 U16 ( .A(ra2[0]), .Y(n292) );
  AND2X2 U17 ( .A(ra2[2]), .B(ra2[1]), .Y(n289) );
  AND2X2 U18 ( .A(ra1[1]), .B(n435), .Y(n290) );
  AND2X2 U19 ( .A(ra1[2]), .B(ra1[1]), .Y(n291) );
  INVX2 U20 ( .A(ra1[0]), .Y(n294) );
  INVX2 U297 ( .A(wd[7]), .Y(n418) );
  INVX2 U298 ( .A(n221), .Y(n419) );
  INVX2 U299 ( .A(wd[6]), .Y(n420) );
  INVX2 U300 ( .A(n223), .Y(n421) );
  INVX2 U301 ( .A(wd[5]), .Y(n422) );
  INVX2 U302 ( .A(n224), .Y(n423) );
  INVX2 U303 ( .A(wd[4]), .Y(n424) );
  INVX2 U304 ( .A(n225), .Y(n425) );
  INVX2 U305 ( .A(wd[3]), .Y(n426) );
  INVX2 U306 ( .A(n226), .Y(n427) );
  INVX2 U307 ( .A(wd[2]), .Y(n428) );
  INVX2 U308 ( .A(n227), .Y(n429) );
  INVX2 U309 ( .A(wd[1]), .Y(n430) );
  INVX2 U310 ( .A(n228), .Y(n431) );
  INVX2 U311 ( .A(wd[0]), .Y(n432) );
  INVX2 U312 ( .A(n229), .Y(n433) );
  INVX2 U313 ( .A(n178), .Y(n434) );
  INVX2 U314 ( .A(ra1[2]), .Y(n435) );
  INVX2 U315 ( .A(n86), .Y(n436) );
  INVX2 U316 ( .A(ra2[2]), .Y(n437) );
  INVX2 U317 ( .A(n231), .Y(n438) );
  INVX2 U318 ( .A(wa[1]), .Y(n439) );
  INVX2 U319 ( .A(wa[0]), .Y(n440) );
  INVX2 U320 ( .A(test_so), .Y(n441) );
  INVX2 U321 ( .A(RAM_62_), .Y(n442) );
  INVX2 U322 ( .A(RAM_61_), .Y(n443) );
  INVX2 U323 ( .A(RAM_60_), .Y(n444) );
  INVX2 U324 ( .A(RAM_59_), .Y(n445) );
  INVX2 U325 ( .A(RAM_58_), .Y(n446) );
  INVX2 U326 ( .A(RAM_57_), .Y(n447) );
  INVX2 U327 ( .A(RAM_56_), .Y(n448) );
  INVX2 U328 ( .A(RAM_55_), .Y(n449) );
  INVX2 U329 ( .A(RAM_54_), .Y(n450) );
  INVX2 U330 ( .A(RAM_53_), .Y(n451) );
  INVX2 U331 ( .A(RAM_52_), .Y(n452) );
  INVX2 U332 ( .A(RAM_51_), .Y(n453) );
  INVX2 U333 ( .A(RAM_50_), .Y(n454) );
  INVX2 U334 ( .A(RAM_49_), .Y(n455) );
  INVX2 U335 ( .A(RAM_48_), .Y(n456) );
  INVX2 U336 ( .A(RAM_47_), .Y(n457) );
  INVX2 U337 ( .A(RAM_46_), .Y(n458) );
  INVX2 U338 ( .A(RAM_45_), .Y(n459) );
  INVX2 U339 ( .A(RAM_44_), .Y(n460) );
  INVX2 U340 ( .A(RAM_43_), .Y(n461) );
  INVX2 U341 ( .A(RAM_42_), .Y(n462) );
  INVX2 U342 ( .A(RAM_41_), .Y(n463) );
  INVX2 U343 ( .A(RAM_40_), .Y(n464) );
  INVX2 U344 ( .A(RAM_31_), .Y(n465) );
  INVX2 U345 ( .A(RAM_30_), .Y(n466) );
  INVX2 U346 ( .A(RAM_29_), .Y(n467) );
  INVX2 U347 ( .A(RAM_28_), .Y(n468) );
  INVX2 U348 ( .A(RAM_27_), .Y(n469) );
  INVX2 U349 ( .A(RAM_26_), .Y(n470) );
  INVX2 U350 ( .A(RAM_25_), .Y(n471) );
  INVX2 U351 ( .A(RAM_24_), .Y(n472) );
  INVX2 U352 ( .A(RAM_23_), .Y(n473) );
  INVX2 U353 ( .A(RAM_22_), .Y(n474) );
  INVX2 U354 ( .A(RAM_21_), .Y(n475) );
  INVX2 U355 ( .A(RAM_20_), .Y(n476) );
  INVX2 U356 ( .A(RAM_19_), .Y(n477) );
  INVX2 U357 ( .A(RAM_18_), .Y(n478) );
  INVX2 U358 ( .A(RAM_17_), .Y(n479) );
  INVX2 U359 ( .A(RAM_16_), .Y(n480) );
  INVX2 U360 ( .A(RAM_15_), .Y(n481) );
  INVX2 U361 ( .A(RAM_14_), .Y(n482) );
  INVX2 U362 ( .A(RAM_13_), .Y(n483) );
  INVX2 U363 ( .A(RAM_12_), .Y(n484) );
  INVX2 U364 ( .A(RAM_11_), .Y(n485) );
  INVX2 U365 ( .A(RAM_10_), .Y(n486) );
  INVX2 U366 ( .A(RAM_9_), .Y(n487) );
  INVX2 U367 ( .A(RAM_8_), .Y(n488) );
  INVX2 U368 ( .A(regwrite), .Y(n489) );
endmodule


module dff_WIDTH8_test_3 ( clk, d, q, test_si, test_se );
  input [7:0] d;
  output [7:0] q;
  input clk, test_si, test_se;


  DFFPOSX1_SCAN q_reg_7_ ( .D(d[7]), .TI(q[6]), .TE(test_se), .CLK(clk), .Q(
        q[7]) );
  DFFPOSX1_SCAN q_reg_6_ ( .D(d[6]), .TI(q[5]), .TE(test_se), .CLK(clk), .Q(
        q[6]) );
  DFFPOSX1_SCAN q_reg_5_ ( .D(d[5]), .TI(q[4]), .TE(test_se), .CLK(clk), .Q(
        q[5]) );
  DFFPOSX1_SCAN q_reg_4_ ( .D(d[4]), .TI(q[3]), .TE(test_se), .CLK(clk), .Q(
        q[4]) );
  DFFPOSX1_SCAN q_reg_3_ ( .D(d[3]), .TI(q[2]), .TE(test_se), .CLK(clk), .Q(
        q[3]) );
  DFFPOSX1_SCAN q_reg_2_ ( .D(d[2]), .TI(q[1]), .TE(test_se), .CLK(clk), .Q(
        q[2]) );
  DFFPOSX1_SCAN q_reg_1_ ( .D(d[1]), .TI(q[0]), .TE(test_se), .CLK(clk), .Q(
        q[1]) );
  DFFPOSX1_SCAN q_reg_0_ ( .D(d[0]), .TI(test_si), .TE(test_se), .CLK(clk), 
        .Q(q[0]) );
endmodule


module datapath_WIDTH8_REGBITS3_test_1 ( clk, reset, const_gnd, memdata, 
        alusrca, memtoreg, iord, pcen, regwrite, regdst, pcsource, alusrcb, 
        irwrite, alucont, zero, instr, adr, writedata, test_si, test_se );
  input [7:0] memdata;
  input [1:0] pcsource;
  input [1:0] alusrcb;
  input [3:0] irwrite;
  input [2:0] alucont;
  output [31:0] instr;
  output [7:0] adr;
  output [7:0] writedata;
  input clk, reset, const_gnd, alusrca, memtoreg, iord, pcen, regwrite, regdst,
         test_si, test_se;
  output zero;
  wire   n3, n4, n5, n7;
  wire   [2:0] wa;
  wire   [7:0] nextpc;
  wire   [7:0] pc;
  wire   [7:0] md;
  wire   [7:0] rd1;
  wire   [7:0] a;
  wire   [7:0] rd2;
  wire   [7:0] aluresult;
  wire   [7:0] aluout;
  wire   [7:0] src1;
  wire   [7:0] src2;
  wire   [7:0] wd;

  mux2_WIDTH3 regmux ( .d0(instr[18:16]), .d1(instr[13:11]), .s(regdst), .y(wa) );
  dffen_WIDTH8_test_0 ir0 ( .clk(clk), .en(irwrite[3]), .d(memdata), .q(
        instr[7:0]), .test_si(a[7]), .test_se(test_se) );
  dffen_WIDTH8_test_1 ir1 ( .clk(clk), .en(irwrite[2]), .d(memdata), .q(
        instr[15:8]), .test_si(instr[7]), .test_se(test_se) );
  dffen_WIDTH8_test_2 ir2 ( .clk(clk), .en(irwrite[1]), .d(memdata), .q(
        instr[23:16]), .test_si(instr[15]), .test_se(test_se) );
  dffen_WIDTH8_test_3 ir3 ( .clk(clk), .en(irwrite[0]), .d(memdata), .q(
        instr[31:24]), .test_si(instr[23]), .test_se(test_se) );
  dffenr_WIDTH8_test_1 pcreg ( .clk(clk), .reset(reset), .en(pcen), .d(nextpc), 
        .q(pc), .test_si(md[7]), .test_se(test_se) );
  dff_WIDTH8_test_1 mdr ( .clk(clk), .d(memdata), .q(md), .test_si(instr[31]), 
        .test_se(test_se) );
  dff_WIDTH8_test_0 areg ( .clk(clk), .d(rd1), .q(a), .test_si(test_si), 
        .test_se(test_se) );
  dff_WIDTH8_test_3 wrd ( .clk(clk), .d(rd2), .q(writedata), .test_si(n7), 
        .test_se(test_se) );
  dff_WIDTH8_test_2 res ( .clk(clk), .d(aluresult), .q(aluout), .test_si(pc[7]), .test_se(test_se) );
  mux2_WIDTH8_2 adrmux ( .d0(pc), .d1(aluout), .s(iord), .y(adr) );
  mux2_WIDTH8_1 src1mux ( .d0(pc), .d1(a), .s(alusrca), .y(src1) );
  mux4_WIDTH8_1 src2mux ( .d0(writedata), .d1({n5, n4, n5, n4, n5, n4, n5, n3}), .d2(instr[7:0]), .d3({instr[5:0], n4, n5}), .s(alusrcb), .y(src2) );
  mux4_WIDTH8_0 pcmux ( .d0(aluresult), .d1(aluout), .d2({instr[5:0], n5, n4}), 
        .d3({n4, n5, n4, n5, n4, n5, n4, n5}), .s(pcsource), .y(nextpc) );
  mux2_WIDTH8_0 wdmux ( .d0(aluout), .d1(md), .s(memtoreg), .y(wd) );
  regfile_WIDTH8_REGBITS3_test_1 rf ( .clk(clk), .regwrite(regwrite), .ra1(
        instr[23:21]), .ra2(instr[18:16]), .wa(wa), .wd(wd), .rd1(rd1), .rd2(
        rd2), .test_si(aluout[7]), .test_so(n7), .test_se(test_se) );
  alu_WIDTH8 alunit ( .a(src1), .b(src2), .alucont(alucont), .result(aluresult) );
  zerodetect_WIDTH8 zd ( .a(aluresult), .y(zero) );
  INVX2 U1 ( .A(n3), .Y(n4) );
  INVX2 U2 ( .A(n3), .Y(n5) );
  INVX2 U3 ( .A(const_gnd), .Y(n3) );
endmodule


module controller_test_1 ( alusrca, alusrcb, aluop, pcen, iord, irwrite, 
        memread, memwrite, memtoreg, pcsource, regwrite, regdst, op, clk, 
        reset, zero, test_si, test_so, test_se );
  output [1:0] alusrcb;
  output [1:0] aluop;
  output [3:0] irwrite;
  output [1:0] pcsource;
  input [5:0] op;
  input clk, reset, zero, test_si, test_se;
  output alusrca, pcen, iord, memread, memwrite, memtoreg, regwrite, regdst,
         test_so;
  wire   state_2_, state_1_, state_0_, N45, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n103, n104, n105,
         n107, n108, n109, n110, n111, n112, n113;

  INVX2 U3 ( .A(n39), .Y(pcsource[1]) );
  INVX2 U4 ( .A(n36), .Y(memtoreg) );
  INVX2 U5 ( .A(n53), .Y(irwrite[1]) );
  AND2X2 U6 ( .A(n40), .B(n107), .Y(memwrite) );
  INVX2 U9 ( .A(n73), .Y(aluop[0]) );
  OAI21X1 U37 ( .A(n34), .B(n35), .C(n36), .Y(regwrite) );
  AOI21X1 U38 ( .A(n37), .B(n35), .C(n34), .Y(regdst) );
  NAND2X1 U39 ( .A(n38), .B(n97), .Y(pcen) );
  AOI21X1 U40 ( .A(zero), .B(pcsource[0]), .C(pcsource[1]), .Y(n38) );
  NAND3X1 U41 ( .A(n40), .B(state_0_), .C(state_2_), .Y(n39) );
  OAI21X1 U42 ( .A(n42), .B(n43), .C(n113), .Y(n41) );
  OAI21X1 U43 ( .A(n96), .B(n44), .C(n90), .Y(n43) );
  AOI21X1 U44 ( .A(op[1]), .B(op[2]), .C(n46), .Y(n45) );
  NAND2X1 U45 ( .A(n47), .B(n100), .Y(n44) );
  NAND2X1 U46 ( .A(n48), .B(n99), .Y(n42) );
  OAI21X1 U47 ( .A(n50), .B(n51), .C(n113), .Y(n49) );
  OAI21X1 U48 ( .A(n94), .B(n108), .C(n52), .Y(n51) );
  NAND3X1 U49 ( .A(n109), .B(n99), .C(n53), .Y(n50) );
  OAI21X1 U50 ( .A(n55), .B(n56), .C(n113), .Y(n54) );
  OAI21X1 U51 ( .A(n57), .B(n46), .C(n58), .Y(n56) );
  NAND3X1 U52 ( .A(n47), .B(n59), .C(n60), .Y(n58) );
  NAND3X1 U53 ( .A(n91), .B(n60), .C(n61), .Y(n46) );
  NOR2X1 U54 ( .A(op[4]), .B(op[0]), .Y(n61) );
  XNOR2X1 U55 ( .A(op[1]), .B(op[2]), .Y(n57) );
  NAND3X1 U56 ( .A(n62), .B(n63), .C(n52), .Y(n55) );
  NAND3X1 U57 ( .A(n100), .B(n64), .C(n47), .Y(n52) );
  OAI21X1 U58 ( .A(op[3]), .B(n93), .C(n65), .Y(n64) );
  NAND2X1 U59 ( .A(n40), .B(n98), .Y(n36) );
  NAND2X1 U60 ( .A(n97), .B(n48), .Y(memread) );
  OAI21X1 U61 ( .A(n34), .B(n37), .C(n66), .Y(iord) );
  NOR2X1 U62 ( .A(memwrite), .B(n105), .Y(n66) );
  NAND3X1 U63 ( .A(state_2_), .B(state_0_), .C(n67), .Y(n48) );
  NAND2X1 U64 ( .A(n108), .B(n68), .Y(alusrcb[1]) );
  NAND2X1 U65 ( .A(n97), .B(n108), .Y(alusrcb[0]) );
  NAND3X1 U66 ( .A(n53), .B(n109), .C(n70), .Y(n69) );
  NOR2X1 U67 ( .A(irwrite[3]), .B(irwrite[2]), .Y(n70) );
  NAND2X1 U68 ( .A(n67), .B(n107), .Y(n62) );
  NAND2X1 U69 ( .A(state_0_), .B(n111), .Y(n35) );
  NAND3X1 U70 ( .A(n112), .B(n110), .C(n103), .Y(n63) );
  NOR2X1 U71 ( .A(n71), .B(state_2_), .Y(irwrite[0]) );
  NAND2X1 U72 ( .A(n67), .B(n98), .Y(n53) );
  NAND3X1 U73 ( .A(n73), .B(n99), .C(n68), .Y(alusrca) );
  NOR2X1 U74 ( .A(n72), .B(n34), .Y(aluop[1]) );
  NAND2X1 U75 ( .A(test_so), .B(state_1_), .Y(n34) );
  NAND2X1 U76 ( .A(n103), .B(n40), .Y(n73) );
  NOR2X1 U77 ( .A(n110), .B(state_1_), .Y(n40) );
  NAND3X1 U78 ( .A(n74), .B(n72), .C(n75), .Y(N45) );
  AOI21X1 U79 ( .A(n104), .B(n112), .C(n76), .Y(n75) );
  OAI21X1 U80 ( .A(n77), .B(n108), .C(n78), .Y(n76) );
  OAI21X1 U81 ( .A(n94), .B(n65), .C(n100), .Y(n78) );
  NAND2X1 U82 ( .A(n67), .B(n103), .Y(n68) );
  NAND2X1 U83 ( .A(state_2_), .B(n104), .Y(n37) );
  NOR2X1 U84 ( .A(n112), .B(test_so), .Y(n67) );
  NAND2X1 U85 ( .A(op[3]), .B(n93), .Y(n65) );
  NOR2X1 U86 ( .A(n95), .B(op[2]), .Y(n47) );
  NOR2X1 U87 ( .A(n71), .B(n111), .Y(n60) );
  NAND3X1 U88 ( .A(n112), .B(n110), .C(state_0_), .Y(n71) );
  AOI21X1 U89 ( .A(op[2]), .B(n59), .C(n95), .Y(n77) );
  NOR3X1 U90 ( .A(op[1]), .B(op[4]), .C(op[0]), .Y(n79) );
  NAND2X1 U91 ( .A(n96), .B(n93), .Y(n59) );
  NAND2X1 U92 ( .A(n104), .B(n111), .Y(n72) );
  NOR2X1 U93 ( .A(test_so), .B(reset), .Y(n74) );
  DFFPOSX1_SCAN state_reg_0_ ( .D(N45), .TI(test_si), .TE(test_se), .CLK(clk), 
        .Q(state_0_) );
  DFFPOSX1_SCAN state_reg_3_ ( .D(n89), .TI(state_2_), .TE(test_se), .CLK(clk), 
        .Q(test_so) );
  DFFPOSX1_SCAN state_reg_2_ ( .D(n88), .TI(state_1_), .TE(test_se), .CLK(clk), 
        .Q(state_2_) );
  DFFPOSX1_SCAN state_reg_1_ ( .D(n92), .TI(state_0_), .TE(test_se), .CLK(clk), 
        .Q(state_1_) );
  INVX2 U16 ( .A(n54), .Y(n88) );
  INVX2 U17 ( .A(n41), .Y(n89) );
  INVX2 U18 ( .A(n45), .Y(n90) );
  INVX2 U19 ( .A(n59), .Y(n91) );
  INVX2 U20 ( .A(n49), .Y(n92) );
  INVX2 U21 ( .A(op[5]), .Y(n93) );
  INVX2 U22 ( .A(n47), .Y(n94) );
  INVX2 U23 ( .A(n79), .Y(n95) );
  INVX2 U24 ( .A(op[3]), .Y(n96) );
  INVX2 U25 ( .A(n69), .Y(n97) );
  INVX2 U26 ( .A(n72), .Y(n98) );
  INVX2 U27 ( .A(aluop[1]), .Y(n99) );
  INVX2 U28 ( .A(n68), .Y(n100) );
  INVX2 U29 ( .A(n73), .Y(pcsource[0]) );
  INVX2 U30 ( .A(n63), .Y(irwrite[3]) );
  INVX2 U31 ( .A(n37), .Y(n103) );
  INVX2 U32 ( .A(state_0_), .Y(n104) );
  INVX2 U33 ( .A(n48), .Y(n105) );
  INVX2 U34 ( .A(n62), .Y(irwrite[2]) );
  INVX2 U35 ( .A(n35), .Y(n107) );
  INVX2 U36 ( .A(n60), .Y(n108) );
  INVX2 U94 ( .A(irwrite[0]), .Y(n109) );
  INVX2 U95 ( .A(test_so), .Y(n110) );
  INVX2 U96 ( .A(state_2_), .Y(n111) );
  INVX2 U97 ( .A(state_1_), .Y(n112) );
  INVX2 U98 ( .A(reset), .Y(n113) );
endmodule


module mips ( clk, reset, const_gnd, memdata, memread, memwrite, adr, 
        writedata, test_si, test_so, test_se );
  input [7:0] memdata;
  output [7:0] adr;
  output [7:0] writedata;
  input clk, reset, const_gnd, test_si, test_se;
  output memread, memwrite, test_so;
  wire   zero, alusrca, memtoreg, iord, pcen, regwrite, regdst, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n38, n40, SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2,
         SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4,
         SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6,
         SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8,
         SYNOPSYS_UNCONNECTED_9, SYNOPSYS_UNCONNECTED_10,
         SYNOPSYS_UNCONNECTED_11, SYNOPSYS_UNCONNECTED_12,
         SYNOPSYS_UNCONNECTED_13, SYNOPSYS_UNCONNECTED_14,
         SYNOPSYS_UNCONNECTED_15, SYNOPSYS_UNCONNECTED_16,
         SYNOPSYS_UNCONNECTED_17, SYNOPSYS_UNCONNECTED_18,
         SYNOPSYS_UNCONNECTED_19, SYNOPSYS_UNCONNECTED_20;
  wire   [31:0] instr;
  wire   [1:0] pcsource;
  wire   [1:0] alusrcb;
  wire   [1:0] aluop;
  wire   [3:0] irwrite;
  wire   [2:0] alucont;

  controller_test_1 cont ( .alusrca(alusrca), .alusrcb(alusrcb), .aluop(aluop), 
        .pcen(pcen), .iord(iord), .irwrite(irwrite), .memread(memread), 
        .memwrite(memwrite), .memtoreg(memtoreg), .pcsource(pcsource), 
        .regwrite(regwrite), .regdst(regdst), .op(instr[31:26]), .clk(clk), 
        .reset(n20), .zero(zero), .test_si(test_si), .test_so(n38), .test_se(
        test_se) );
  alucontrol ac ( .alucont(alucont), .aluop(aluop), .funct(instr[5:0]) );
  datapath_WIDTH8_REGBITS3_test_1 dp ( .clk(clk), .reset(n20), .const_gnd(
        const_gnd), .memdata({n36, n34, n32, n30, n28, n26, n24, n22}), 
        .alusrca(alusrca), .memtoreg(memtoreg), .iord(iord), .pcen(pcen), 
        .regwrite(regwrite), .regdst(regdst), .pcsource(pcsource), .alusrcb(
        alusrcb), .irwrite(irwrite), .alucont(alucont), .zero(zero), .instr({
        instr[31:26], SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2, 
        SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4, SYNOPSYS_UNCONNECTED_5, 
        SYNOPSYS_UNCONNECTED_6, SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8, 
        SYNOPSYS_UNCONNECTED_9, SYNOPSYS_UNCONNECTED_10, 
        SYNOPSYS_UNCONNECTED_11, SYNOPSYS_UNCONNECTED_12, 
        SYNOPSYS_UNCONNECTED_13, SYNOPSYS_UNCONNECTED_14, 
        SYNOPSYS_UNCONNECTED_15, SYNOPSYS_UNCONNECTED_16, 
        SYNOPSYS_UNCONNECTED_17, SYNOPSYS_UNCONNECTED_18, 
        SYNOPSYS_UNCONNECTED_19, SYNOPSYS_UNCONNECTED_20, instr[5:0]}), .adr(
        adr), .writedata(writedata), .test_si(n38), .test_se(test_se) );
  INVX2 U1 ( .A(reset), .Y(n19) );
  INVX2 U2 ( .A(n19), .Y(n20) );
  INVX2 U3 ( .A(memdata[0]), .Y(n21) );
  INVX2 U4 ( .A(n21), .Y(n22) );
  INVX2 U5 ( .A(memdata[1]), .Y(n23) );
  INVX2 U6 ( .A(n23), .Y(n24) );
  INVX2 U7 ( .A(memdata[2]), .Y(n25) );
  INVX2 U8 ( .A(n25), .Y(n26) );
  INVX2 U9 ( .A(memdata[3]), .Y(n27) );
  INVX2 U10 ( .A(n27), .Y(n28) );
  INVX2 U11 ( .A(memdata[4]), .Y(n29) );
  INVX2 U12 ( .A(n29), .Y(n30) );
  INVX2 U13 ( .A(memdata[5]), .Y(n31) );
  INVX2 U14 ( .A(n31), .Y(n32) );
  INVX2 U15 ( .A(memdata[6]), .Y(n33) );
  INVX2 U16 ( .A(n33), .Y(n34) );
  INVX2 U17 ( .A(memdata[7]), .Y(n35) );
  INVX2 U18 ( .A(n35), .Y(n36) );
  INVX8 U19 ( .A(writedata[7]), .Y(n40) );
  INVX8 U20 ( .A(n40), .Y(test_so) );
endmodule

