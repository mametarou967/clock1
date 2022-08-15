module cnt60(
	input clk,
	input rst,
	input clr,
	input enin,
	input inc,
   output  reg [3:0]   sec,
   output  reg [3:0]   min,
	output  enout
);

// reg  [3:0] sec;

always @( posedge clk ) begin
    if ( rst | clr )
        sec <= 4'h0;
    else if ( enin  || inc )
        if ( sec==4'h9 )
            sec <= 4'h0;
        else
            sec <= sec + 4'h1;
end

/* 10秒桁 */
// reg  [3:0] min;

always @( posedge clk ) begin
    if( rst | clr )
        min <= 3'd0;
    else if( ( enin || inc ) && sec==4'd9 ) begin
        if( min==3'd5 )
            min <= 3'd0;
        else
            min <= min + 3'd1;
    end
end

assign enout = ((min == 3'd5) && (sec == 4'd9) && enin) ? 1 : 0;

endmodule