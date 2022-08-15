module CLOCK1 (
    input CLK,
	 input RST,
    input   [2:0]   KEY,
    output  [6:0]   HEX0,
    output  [6:0]   HEX1,
	 output	[6:0]   HEX2,
	 output	[6:0]   HEX3,
	 output	[6:0]   HEX4,
	 output	[6:0]   HEX5
);

wire en1hz;
wire min_enable;
wire hour_enable;
wire clr,min_up,sec_up;
wire [3:0] sec_lower;
wire [3:0] sec_upper;
wire [3:0] min_lower;
wire [3:0] min_upper;
wire [3:0] hour_lower;
wire [3:0] hour_upper;

// ボタン
btn_in btn_in_ins(.clk(CLK),.rst(RST),.nBIN(KEY),.BOUT({min_up,sec_up,clr}));
// 1秒カウンタの生成
cnt1sec cnt1sec_ins(.clk(CLK),.rst(RST),.en1hz(en1hz));
// 時分秒カウンタ
seccnt seccnt_ins(.clk(CLK),.rst(RST),.clr(clr),.enin(en1hz),.min(sec_upper),.sec(sec_lower),.enout(min_enable));
mincnt mincnt_ins(.clk(CLK),.rst(RST),.enin(min_enable),.min(min_upper),.sec(min_lower),.enout(hour_enable));
hourcnt hourcnt_ins(.clk(CLK),.rst(RST),.enin(hour_enable),.min(hour_upper),.sec(hour_lower));

// 7seg
seg7dec seg7dec_ins1(.seg(sec_lower),.dec(HEX0));
seg7dec seg7dec_ins2(.seg(sec_upper),.dec(HEX1));
seg7dec seg7dec_ins3(.seg(min_lower),.dec(HEX2));
seg7dec seg7dec_ins4(.seg(min_upper),.dec(HEX3));
seg7dec seg7dec_ins5(.seg(hour_lower),.dec(HEX4));
seg7dec seg7dec_ins6(.seg(hour_upper),.dec(HEX5));

endmodule