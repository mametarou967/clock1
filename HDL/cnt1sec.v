module cnt1sec(
	input clk,
	input rst,
	output en1hz,
	output reg sig2hz
);

reg[25:0] cnt;

always @ (posedge clk) begin
  if(rst)
    cnt <= 26'b0;
  else if( en1hz )
    cnt <= 26'b0;
  else
    cnt <= cnt + 26'b1;
end


assign en1hz = (cnt == 26'd49_999_999);

wire cnt37499999 = (cnt==26'd37499999);
wire cnt24999999 = (cnt==26'd24999999);
wire cnt12499999 = (cnt==26'd12499999);

always@(posedge clk) begin
  if(rst)
		sig2hz <= 1'b0;
	else if(en1hz | cnt12499999 | cnt24999999 | cnt37499999)
		sig2hz <= ~sig2hz;
end

endmodule