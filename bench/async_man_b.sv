/*
* TestBench
* Basic async control module testbench
*/



module async_man_b ();

  timeunit 1ns;
  timeprecision 100ps;

  logic reset;
  logic req1;
  logic ack1;

  logic req2;
  logic ack2;

  async_man_m async_man(
    .in_req(req1),
    .in_ack(ack1),
    .reset(reset),
    .out_req(req2),
    .out_ack(ack2),
    .aclk()
  );

  initial begin
    $timeformat ( -9, 1, " ns", 9 );
  end

  initial begin
    reset = 1'b1;
    #(1);
    reset = 1'b0;
    #(1);

  end


endmodule
