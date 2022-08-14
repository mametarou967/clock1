module CLOCK1 (
    input CLK,
	 input RST,
    input   [3:0]   SW,
    output  [6:0]   HEX0,
    output  [6:0]   HEX1
);

reg[25:0] cnt;
wire en1hz = (cnt == 26'd49_999_999);

always @ (posedge CLK) begin
  if(RST)
    cnt <= 26'b0;
  else if( en1hz )
    cnt <= 26'b0;
  else
    cnt <= cnt + 26'b1;
end

reg [3:0] sec;

always@(posedge CLK) begin
  if( RST )
    sec <= 4'h0;
  else if (en1hz)
    if( sec == 4'h9 )
      sec <= 4'h0;
    else
      sec <= sec + 4'h1;
end

seg7dec seg7dec_ins1(.seg(sec),.dec(HEX0));
seg7dec seg7dec_ins2(.seg(sec),.dec(HEX1));

endmodule