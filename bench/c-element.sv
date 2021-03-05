/*
* TestBench
* Basic c-element interpretation
*/


timeunit 1ns;
timeprecision 1ns;

module c_element_b ();

  wire reset;
  wire in1, in2;
  wire out;

  c_element c_element_t (
    .rst(reset)
    .a(in1)
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

  
