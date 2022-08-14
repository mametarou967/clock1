module cnt1sec(
	input clk,
	input rst,
	output en1hz
);

reg[25:0] cnt;
assign en1hz = (cnt == 26'd49_999_999);

always @ (posedge clk) begin
  if(rst)
    cnt <= 26'b0;
  else if( en1hz )
    cnt <= 26'b0;
  else
    cnt <= cnt + 26'b1;
end

endmodule