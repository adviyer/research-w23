module FA(a, b, cin, s, cout);
	input a,b,cin;
	output s, cout;
	wire w1,w2,w3;

	xor xor1(w1, a, b);
	xor xor2(s, w1, cin);
	and and1(w2, a, b);
	and and2(w3, w1, cin);
	or or1(cout, w2, w3);
endmodule

module AddSub4(A, B, Co, R, ovf);
  input [3:0] A, B;
  input Co;
  output[3:0] R;
  output ovf;

  wire[3:0] Cout;

  xor xor1(i1, B[0], Co);
  FA FA1(A[0], i1, Co, R[0], Cout[0]);

  xor xor2(i2, B[1], Co);
  FA FA2(A[1], i2, cout[0], R[1], Cout[1]);

  xor xor3(i3, B[2], Co);
  FA FA3(A[2],i3,cout[1],R[2],Cout[2]);

  xor xor4(i4,B[3],Co);
  FA FA4(A[3],i4,cout[2],R[3],Cout[3]);

  xor overflow(ovf,Cout[3],Cout[2]);
  
endmodule

