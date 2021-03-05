/*
* TestBench
* Basic c-element interpretation
*/


timeunit 1ns;
timeprecision 1ns;

module c_element_b ();

  logic reset;
  logic in1, in2;
  logic out;

  c_element_m c_element (
    .rst(reset),
    .o(out),
    .a(in1),
    .b(in2)
  );

  initial $timeformat ( -9, 1, "ns", 12 );

  initial begin
    in1 = 1'b1;
    in2 = 1'b1;
    #30;
    in1 = 1'b0;
    in2 = 1'b1;
    #30;
    in1 = 1'b0;
    in2 = 1'b0;
  end

endmodule
