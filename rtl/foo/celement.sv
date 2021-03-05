/*
* First implementation of a C-element
* Test file.
*/

module c_element (
  input wire a,
  input wire rst,
  input wire b,
  output logic o
);

always_ff @ (a,b) begin
  if ( 1 == rst ) begin
    o <= 1'b0;
  end else if
    case ({a,b})
      2'b00 : o <= 1'b0;
      2'b11 : o <= 1'b1;
    endcase
  end
end

endmodule;
