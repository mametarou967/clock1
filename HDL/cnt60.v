module cnt60(
	input clk,
	input rst,
	input en1hz,
   output  reg [3:0]   sec,
   output  reg [3:0]   min
);

// reg  [3:0] sec;

always @( posedge clk ) begin
    if ( rst )
        sec <= 4'h0;
    else if ( en1hz )
        if ( sec==4'h9 )
            sec <= 4'h0;
        else
            sec <= sec + 4'h1;
end

/* 10秒桁 */
// reg  [3:0] min;

always @( posedge clk ) begin
    if( rst )
        min <= 3'd0;
    else if( en1hz && sec==4'd9 ) begin
        if( min==3'd5 )
            min <= 3'd0;
        else
            min <= min + 3'd1;
    end
end

endmodule