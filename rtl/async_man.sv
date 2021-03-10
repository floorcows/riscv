/* Basic asynchronous control module */

module async_man_m
  #(parameter DELAY=10)(
  input wire left_req_in,
  output wire left_ack_out,
  input logic reset,
  input logic set,
  output logic right_req_out,
  input logic right_ack_in,
  output logic aclk //Register control signal
);

timeunit 1ns;
timeprecision 100ps;

logic delayed_req;

//not(right_ack_in,muller_in);
assign muller_in = ~right_ack_in;

//C element instantiation
c_element_m c_element_I(
  .a(delayed_req),
  .b(muller_in),
  .rst(reset),
  .set(set),
  .o(aclk)
);

//Some outputs are connected
assign left_ack_out = aclk;
assign right_req_out = aclk;


//Basic delay module implementation
always @(left_req_in) begin
  delayed_req = #(DELAY) left_req_in;
end

endmodule
