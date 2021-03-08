/* Basic asynchronous control module */

module seq_ctrl_m
  #(parameter DELAY_CTRL=10,
    parameter WIDTH=1)(

  //Data wires
  input wire [WIDTH-1:0] data_in,
  output logic [WIDTH-1:0] data_out,
  input wire data_reset,

  //Async manager signals
  input wire left_req_in,
  output wire left_ack_out,
  input logic reset,
  input logic set,
  output logic right_req_out,
  input logic right_ack_in,
  output logic aclk //Register control signal
);

//async manager instantiation
async_man_m #(.DELAY(DELAY_CTRL)) async_man_I(
  .left_req_in(left_req_in),
  .left_ack_out(left_ack_out),
  .reset(reset),
  .set(set),
  .right_req_out(right_req_out),
  .right_ack_in(right_ack_in),
  .aclk(aclk) //Register control signal
);

//Variable lenght register
always @(aclk) begin
  if ( 0 == data_reset ) begin
    data_out = 0;
  end else begin
    data_out <= data_in;
  end
end

endmodule
