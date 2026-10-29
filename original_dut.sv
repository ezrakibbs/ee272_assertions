`timescale 1ns/10ps
// prints out the state values
//
module dut(intf.idut ix);

default clocking @(posedge(ix.clk));

endclocking

always @(posedge(ix.clk)) begin
  $display(ix.state);
end
endmodule
