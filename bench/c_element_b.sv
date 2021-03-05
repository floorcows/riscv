/*
* TestBench
* Basic c-element interpretation
*/



module c_element_b ();

  timeunit 1ns;
  timeprecision 100ps;

  logic reset;
  logic in1, in2;
  logic out;
  logic clk;

  c_element_m c_element (
    .rst(reset),
    .o(out),
    .a(clk),
    .b(in2)
  );

  localparam clk_period = 10;
  always #(clk_period/2) clk = ~clk;

  initial begin
    $timeformat ( -9, 1, " ns", 9 );
  end

  initial begin
    clk = 1'b0;
    in1 = 1'b1;
    in2 = 1'b1;
    #(10);
    in1 = 1'b0;
    in2 = 1'b1;
    #(10);
    in1 = 1'b0;
    in2 = 1'b0;
    #(10);
    in1 = 1'b1;
    in2 = 1'b0;
    #(10);
    in1 = 1'b0;
    in2 = 1'b1;
  end

endmodule
