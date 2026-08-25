module cla4(
  input  [3:0] a,
  input  [3:0] b,
  input        cin,
  output [3:0] sum,
  output       cout
);

  wire p0, p1, p2, p3;
  wire g0, g1, g2, g3;
  wire c1, c2, c3;

  xor #(2) xor0(p0, a[0], b[0]);
  xor #(2) xor1(p1, a[1], b[1]);
  xor #(2) xor2(p2, a[2], b[2]);
  xor #(2) xor3(p3, a[3], b[3]);

  and #(2) and0(g0, a[0], b[0]);
  and #(2) and1(g1, a[1], b[1]);
  and #(2) and2(g2, a[2], b[2]);
  and #(2) and3(g3, a[3], b[3]);

  wire p0cin;
  and #(2) and4(p0cin, p0, cin);
  or #(2) or0(c1, g0, p0cin);

  wire p1g0, p1p0cin;
  and #(2) and5(p1g0, p1, g0);
  and #(2) and6(p1p0cin, p1, p0, cin);
  or #(2) or1(c2, g1, p1g0, p1p0cin);


  wire p2g1, p2p1g0, p2p1p0cin;
  and #(2) and7(p2g1, p2, g1);
  and #(2) and8(p2p1g0, p2, p1, g0);
  and #(2) and9(p2p1p0cin, p2, p1, p0, cin);
  or #(2) or2(c3, g2, p2g1, p2p1g0, p2p1p0cin);

  wire p3g2, p3p2g1, p3p2p1g0, p3p2p1p0cin;
  and #(2) and10(p3g2, p3, g2);
  and #(2) and11(p3p2g1, p3, p2, g1);
  and #(2) and12(p3p2p1g0, p3, p2, p1, g0);
  and #(2) and13(p3p2p1p0cin, p3, p2, p1, p0, cin);
  or  #(2) or3(cout, g3, p3g2, p3p2g1, p3p2p1g0, p3p2p1p0cin);

  xor #(2) xor4(sum[0], p0, cin);
  xor #(2) xor5(sum[1], p1, c1);
  xor #(2) xor6(sum[2], p2, c2);
  xor #(2) xor7(sum[3], p3, c3);

endmodule