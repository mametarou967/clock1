module state(
	input clk,
	input rst,
	input sig2hz,
	input mode,
	input select,
	input adjust,
	output secclr,
	output mininc,
	output hourinc,
	output secon,
	output minon,
	output houron
);

reg [1:0] cur,nxt;
localparam NORM=2'b00;
localparam SEC=2'b01;
localparam MIN=2'b10;
localparam HOUR=2'b11;

assign secclr = (cur == SEC) && adjust;
assign mininc = (cur == MIN) && adjust;
assign hourinc = (cur == HOUR) && adjust;

assign secon = ~((cur == SEC) & sig2hz);
assign minon = ~((cur == MIN) & sig2hz);
assign houron = ~((cur == HOUR) & sig2hz);

always @(posedge clk) begin
	if( rst)
		cur <= NORM;
	else
		cur <= nxt;
end

always @* begin
	case(cur)
		NORM: if(mode) nxt = SEC;
				else nxt = NORM;
		SEC: if(mode) nxt = NORM;
			  else if(select) nxt = HOUR;
			  else nxt = SEC;
		MIN: if(mode) nxt = NORM;
			  else if(select) nxt =SEC;
			  else nxt = MIN;
		HOUR: if(mode) nxt = NORM;
				else if(select) nxt = MIN;
				else nxt = HOUR;
		default: nxt = 2'bxx;
	endcase
end
			  
endmodule
	