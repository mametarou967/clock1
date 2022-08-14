module CLOCK1 (
    input CLK,
	 input RST,
    input   [3:0]   SW,
    output  [6:0]   HEX0,
    output  [6:0]   HEX1
);

wire en1hz;
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

cnt1sec cnt1sec_ins(.clk(CLK),.rst(RST),.en1hz(en1hz));
seg7dec seg7dec_ins1(.seg(sec),.dec(HEX0));
seg7dec seg7dec_ins2(.seg(sec),.dec(HEX1));

endmodule