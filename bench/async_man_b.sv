/*
* TestBench
* Basic async control module testbench
*/



module async_man_b ();

  timeunit 1ns;
  timeprecision 100ps;

  logic req1;
  logic ack1;
  logic req2;
  logic ack2;
  logic set;
  logic rst;
  logic out;

  async_man_m async_man(
    .left_req_in(req1),
    .left_ack_out(ack1),
    .right_req_out(req2),
    .right_ack_in(ack2),
    .set(set),
    .reset(rst),
    .aclk(out)
  );

  initial begin
    $timeformat ( -9, 1, " ns", 9 );
  end

  initial begin
    rst = 1;
    set = 0;
    ack2 = 0;
    req1 = 0;
    #(50);
    rst = 0;
    #(1);
    req1 = 1;
    #(5);
    req1 = 0;
  end


endmodule
