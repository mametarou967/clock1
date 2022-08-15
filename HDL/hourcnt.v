module hourcnt(
	input clk,
	input rst,
	input enin,
	input inc,
   output  reg [3:0]   sec,
   output  reg [3:0]   min
);

reg [4:0] cnt24;


always @( posedge clk ) begin
    if ( rst  )
        cnt24 <= 5'd0;
    else if ( enin  || inc )
        if ( cnt24==5'd23 )
            cnt24 <= 5'd0;
        else
            cnt24 <= cnt24 + 5'd1;
end

always @* begin
	case (cnt24)
	5'd0 : begin sec = 4'd0; min =4'd0; end
	5'd1 : begin sec = 4'd1; min =4'd0; end
	5'd2 : begin sec = 4'd2; min =4'd0; end
	5'd3 : begin sec = 4'd3; min =4'd0; end
	5'd4 : begin sec = 4'd4; min =4'd0; end
	5'd5 : begin sec = 4'd5; min =4'd0; end
	5'd6 : begin sec = 4'd6; min =4'd0; end
	5'd7 : begin sec = 4'd7; min =4'd0; end
	5'd8 : begin sec = 4'd8; min =4'd0; end
	5'd9 : begin sec = 4'd9; min =4'd0; end
	5'd10 : begin sec = 4'd0; min =4'd1; end
	5'd11 : begin sec = 4'd1; min =4'd1; end
	5'd12 : begin sec = 4'd2; min =4'd1; end
	5'd13 : begin sec = 4'd3; min =4'd1; end
	5'd14 : begin sec = 4'd4; min =4'd1; end
	5'd15 : begin sec = 4'd5; min =4'd1; end
	5'd16 : begin sec = 4'd6; min =4'd1; end
	5'd17 : begin sec = 4'd7; min =4'd1; end
	5'd18 : begin sec = 4'd8; min =4'd1; end
	5'd19 : begin sec = 4'd9; min =4'd1; end
	5'd20 : begin sec = 4'd0; min =4'd2; end
	5'd21 : begin sec = 4'd1; min =4'd2; end
	5'd22 : begin sec = 4'd2; min =4'd2; end
	5'd23 : begin sec = 4'd3; min =4'd2; end
	default: begin sec = 4'd0; min =4'd0; end
	endcase
end


endmodule