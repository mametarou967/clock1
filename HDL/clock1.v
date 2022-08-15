module CLOCK1 (
    input CLK,
	 input RST,
    input   [3:0]   SW,
    output  [6:0]   HEX0,
    output  [6:0]   HEX1
);

wire en1hz;
wire [3:0] sec;
wire [3:0] min;


cnt1sec cnt1sec_ins(.clk(CLK),.rst(RST),.en1hz(en1hz));
cnt60 cnt60_ins(.clk(CLK),.rst(RST),.en1hz(en1hz),.min(min),.sec(sec));
seg7dec seg7dec_ins1(.seg(sec),.dec(HEX0));
seg7dec seg7dec_ins2(.seg(min),.dec(HEX1));

endmodule