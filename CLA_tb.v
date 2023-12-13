
`include "Carry_Look_Ahead_Adder.v"

module top_4bit_CLA_tb;

    // Inputs
    reg [3:0] A;
    reg [3:0] B;
    reg Cin;

    // Outputs
    wire [3:0] sum;
    wire Cout;

    // Instantiate the Unit Under Test (UUT)
    top_4bit_CLA uut (
        .A(A), 
        .B(B), 
        .Cin(Cin), 
        .sum(sum), 
        .Cout(Cout)
    );

    initial begin
        // Initialize Inputs
        A = 0;
        B = 0;
        Cin = 0;

        // Apply various inputs and wait for a short period of time to observe outputs
        #10
        A = 4'b0101; B = 4'b0011; Cin = 0;  // Example operation
        #10
        A = 4'b1100; B = 4'b0110; Cin = 1;  // Another example operation
        #10
        A = 4'b1000; B = 4'b0010; Cin = 0;  // Another example operation
        #10
        // Continue with more test cases as needed
        // ...

        #20 $finish; // End the simulation
    end

    // Optional: Monitor changes and print
    initial begin
        $monitor("Time = %d : A = %b, B = %b, Cin = %b, Sum = %b, Cout = %b", 
                  $time, A, B, Cin, sum, Cout);
      
      $dumpfile("4bitCLA_output.vcd");
      $dumpvars(0 , uut);
    end

endmodule