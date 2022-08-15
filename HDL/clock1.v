module CLOCK1 (
    input CLK,
	 input RST,
    input   [2:0]   KEY,
    output  [6:0]   HEX0,
    output  [6:0]   HEX1,
	 output	[6:0]   HEX2,
	 output	[6:0]   HEX3
);

wire en1hz;
wire min_enable;
wire clr,min_up,sec_up;
wire [3:0] sec_lower;
wire [3:0] sec_upper;
wire [3:0] min_lower;
wire [3:0] min_upper;

// ボタン
btn_in btn_in_ins(.clk(CLK),.rst(RST),.nBIN(KEY),.BOUT({min_up,sec_up,clr}));
// 1秒カウンタの生成
cnt1sec cnt1sec_ins(.clk(CLK),.rst(RST),.en1hz(en1hz));
// 60秒カウンタ 
cnt60 cnt60_ins_sec(.clk(CLK),.rst(RST),.clr(clr),.enin(en1hz),.inc(sec_up),.min(sec_upper),.sec(sec_lower),.enout(min_enable));
cnt60 cnt60_ins_min(.clk(CLK),.rst(RST),.clr(clr),.enin(min_enable),.inc(min_up),.min(min_upper),.sec(min_lower));
// 7seg
seg7dec seg7dec_ins1(.seg(sec_lower),.dec(HEX0));
seg7dec seg7dec_ins2(.seg(sec_upper),.dec(HEX1));
seg7dec seg7dec_ins3(.seg(min_lower),.dec(HEX2));
seg7dec seg7dec_ins4(.seg(min_upper),.dec(HEX3));

endmodule