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


//Some outputs are connected
assign left_ack_out = right_req_out;
assign aclk = right_req_out;

//NOT gate
wire muller_in;
not(right_ack_in,muller_in);

//Basic delay module implementation
logic delayed_req;
always @(*) begin
  #(DELAY);
  delayed_req <= left_req_in;
end

//C element instantiation
c_element_m c_element_I(
  .a(delayed_req),
  .b(muller_in),
  .rst(reset),
  .set(set),
  .o(aclk)
);


endmodule
