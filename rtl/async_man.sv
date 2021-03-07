/*
* Basic asynchronous control module
*/

module async_man_m
  #(parameter DELAY=10)(
  input wire in_req,
  input wire in_ack,
  input logic reset,
  output logic out_req,
  output logic out_ack,
  output logic aclk //Register control signal
);


//Some outputs are connected
assign out_req = aclk;

//NOT gate
not(in_ack,aclk);

//Basic delay module implementation
logic delayed_req;
always @(*) begin
  #(DELAY);
  delayed_req <= in_req;
end

//C element instantiation
c_element_m c_element_I(
  .a(delayed_req),
  .b(out_ack),
  .rst(reset),
  .o(aclk)
);


endmodule
