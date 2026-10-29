`timescale 1ns/10ps
// prints out the state values
//
module dut(intf.idut ix);

default clocking @(posedge(ix.clk));

endclocking

always @(posedge(ix.clk)) begin
  //$display(ix.state);
end

logic [3:0] old_state;

always@(posedge ix.clk) begin
  old_state = ix.state;
  #2
  if(ix.rst) begin
    assert(ix.state == 0)
    else $display("ERROR: state should be 0");
  end
  else begin
    case(old_state)
      0: begin
        assert(ix.state == 1)
        else $display("ERROR: state should be 1");
      end

      1: begin
        assert((ix.state == 2) || (ix.state == 4))
        else $display("ERROR: state should be 2 or 4");
      end

      2: begin
        assert(ix.state == 3)
        else $display("ERROR: state should be 3");
      end

      3: begin
        assert((ix.state == 5) || (ix.state == 1))
        else $display("ERROR: state should be 5 or 1");
      end

      4: begin
        assert(ix.state == 5)
        else $display("ERROR: state should be 5");
      end

      5: begin
        assert((ix.state == 1) || (ix.state == 6))
        else $display("ERROR: state should be 1 or 6");
      end

      6: begin
        assert(ix.state == 7)
        else $display("ERROR: state should be 7");
      end

      7: begin
        assert((ix.state == 0) || (ix.state == 8))
        else $display("ERROR: state should be 0 or 8");
      end

      8: begin
        assert((ix.state == 2) || (ix.state == 4) || (ix.state == 10) || (ix.state == 9))
        else $display("ERROR: state should be 2, 4, 10, or 9");
      end

      9: begin
        assert(ix.state == 0)
        else $display("ERROR: state should be 0");
      end

      10: begin
        assert(ix.state == 0)
        else $display("ERROR: state should be 0");
      end

      default: begin
        assert(ix.state == 4)
        else $display("ERROR: state should be 4");
      end
    endcase
  end

  $display("old_state: %0d", old_state);
  $display("new_state: %0d", ix.state);

end

endmodule
