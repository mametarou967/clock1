module seg7dec(
    input  [3:0]   seg,
	 input en,
    output reg [6:0]   dec
);


always @* begin
	if( en )
		case( seg )
		  4'h0:   dec = 7'b1000000;
		  4'h1:   dec = 7'b1111001;
		  4'h2:   dec = 7'b0100100;
		  4'h3:   dec = 7'b0110000;
		  4'h4:   dec = 7'b0011001;
		  4'h5:   dec = 7'b0010010;
		  4'h6:   dec = 7'b0000010;
		  4'h7:   dec = 7'b1011000;
		  4'h8:   dec = 7'b0000000;
		  4'h9:   dec = 7'b0010000;
		  4'ha:   dec = 7'b0001000;
		  4'hb:   dec = 7'b0000011;
		  4'hc:   dec = 7'b1000110;
		  4'hd:   dec = 7'b0100001;
		  4'he:   dec = 7'b0000110;
		  4'hf:   dec = 7'b0001110;
		  default:dec = 7'b1111111;
		endcase
	else
		dec = 7'b1111111;
end

endmodule