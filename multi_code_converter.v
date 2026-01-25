module multi_code_converter(in, sel, result);
input [3:0] in;
input [1:0] sel;
output reg [4:0] result;

reg [4:0] bcd, excess3, gray;
parameter BCD = 2'b00, GRAY = 2'b01, EXCESS3 = 2'b10;

always @(*)
begin
case(in)
4'b0000: bcd = 5'b00000;
4'b0001: bcd = 5'b00001;
4'b0010: bcd = 5'b00010;
4'b0011: bcd = 5'b00011;
4'b0100: bcd = 5'b00100;
4'b0101: bcd = 5'b00101;
4'b0110: bcd = 5'b00110;
4'b0111: bcd = 5'b00111;
4'b1000: bcd = 5'b01000;
4'b1001: bcd = 5'b01001;
4'b1010: bcd = 5'b10000;
4'b1011: bcd = 5'b10001;
4'b1100: bcd = 5'b10010;
4'b1101: bcd = 5'b10011;
4'b1110: bcd = 5'b10100;
4'b1111: bcd = 5'b10101;
default: bcd = 5'b00000;
endcase
end

always @(*)
begin
gray[4]= 1'b0;
gray[3]= in[3];
gray[2]= in[3] ^ in[2];
gray[1]= in[2] ^ in[1];
gray[0]= in[1] ^ in[0];
end

always @(*)
begin
excess3 = in + 4'd3;
end

always @(*)
begin
case(sel)
BCD: result = bcd;
GRAY: result = gray;
EXCESS3: result= excess3;
default: result= 5'b00000;
endcase
end

endmodule