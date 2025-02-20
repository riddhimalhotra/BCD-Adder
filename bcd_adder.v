`timescale 1ns / 1ps

///////////BCD ADDER
module bcd_adder(a,b,cin,sum,cout);
input [3:0] a,b;
input cin;
output [3:0] sum;
output cout;
wire s4,f,m1,m2;
wire [3:0] k,r;
fa_4bit x1(a,b,cin,k,s4);
and(m1,k[3],k[2]);
and(m2,k[3],k[1]);
or(f,m1,m2,s4);
buf(r[0],0);
buf(r[1],f);
buf(r[2],f);
buf(r[3],0);
fa_4bit x2(k,r,cin,sum,cout);



endmodule

////////////4- BIT ADDER
module fa_4bit(a,b,cin,sum,cout);
input [3:0] a,b;
input cin;
output [3:0] sum;
output  cout;
wire j1,j2,j3;

fa  f1(a[0],b[0],cin,sum[0],j1);
fa  f2(a[1],b[1],j1,sum[1],j2);
fa  f3(a[2],b[2],j2,sum[2],j3);
fa  f4(a[3],b[3],j3,sum[3],cout);
endmodule
////////////FULL ADDER
module fa(a,b,cin,sum,cout);
input a,b,cin;
output sum,cout;
wire w1,w2,w3;
xor a6(w1,a,b);
and a5(w2,w1,cin);
and a3(w3,a,b);
or a2( cout,w2,w3);
xor a1(sum,a,b,cin);
endmodule