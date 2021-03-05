/*
* Basic asyncronous manager
*/

module async_man_m(
  input wire in_req;
  input wire in_ack;
  input logic reset;
  output logic out_req;
  output logic out_ack;
  output logic aclk;
)

  c_element_m c_element_I(
    .a(),
    .b(),
    .rst(reset),
    .o()
  );
