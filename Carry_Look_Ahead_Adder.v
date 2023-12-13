module FA (input A,
           input B,
           input Cin,
           output sum,
           output Cout);

assign sum = A^B^Cin;
assign Cout = (A & B)| (A & Cin) | (B & Cin);

endmodule


module CLA_Logic (input [3:0]A,
                  input [3:0]B,
                  input  C0,
                  output C1,
                  output C2,
                  output C3,
                  output C4);

wire G0, G1, G2, G3; 
wire P0, P1, P2, P3;

assign G0 = A[0] & B[0];
assign P0 = A[0] ^ B[0];
assign G1 = A[1] & B[1];
assign P1 = A[1] ^ B[1];
assign G2 = A[2] & B[2];
assign P2 = A[2] ^ B[2];
assign G3 = A[3] & B[3];
assign P3 = A[3] ^ B[3];


assign C1 = G0 | (P0 & C0);
assign C2 = G1 | (P1 & G0) | (P1 & P0 & C0);
assign C3 = G2 | (P2 & G1) | (P2 & P1 & G0) | (P2 & P1 & P0 & C0);
assign C4 = G3 | (P3 & G2) | (P3 & P2 & G1) | (P3 & P2 & P1 & G0) | (P3 & P2 & P1 & P0 & C0);
endmodule


module top_4bit_CLA( input [3:0]A,
                     input [3:0]B,
                     input Cin,
                     output [3:0]sum,
                     output Cout);

wire C1, C2, C3, C4;

FA A0 (.A(A[0]), .B(B[0]), .Cin(Cin), .sum(sum[0]));
FA A1 (.A(A[1]), .B(B[1]), .Cin(C1), .sum(sum[1]));
FA A2 (.A(A[2]), .B(B[2]), .Cin(C2), .sum(sum[2]));
FA A3 (.A(A[3]), .B(B[3]), .Cin(C3), .sum(sum[3]));

CLA_Logic CLA (.A(A), .B(B), .C0(Cin), .C1(C1), .C2(C2), .C3(C3), .C4(Cout));


endmodule