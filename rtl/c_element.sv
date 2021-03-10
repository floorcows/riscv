/*
* Implementation of a C element
*/

module c_element_m (
  input wire a,
  input wire set,
  input wire rst,
  input wire b,
  output logic o
);

always_ff @ (a,b,rst,set) begin
  if ( 1 == rst ) begin
    o <= 1'b0;
  end else begin
    if ( 1 == set ) begin
      o <= 0'b0;
    end else begin
      case ({a,b})
        2'b00 : o <= 1'b0;
        2'b11 : o <= 1'b1;
      endcase
    end
  end
end

endmodule
