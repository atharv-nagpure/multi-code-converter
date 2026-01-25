`timescale 1ns/1ps

module code_converter_tb;
reg [3:0] in;
reg [1:0] sel;
wire [4:0] result;

multi_code_converter uut (
    .in(in),
    .sel(sel),
    .result(result));
initial begin
    $monitor("Time=%0t | Input(in)=%b | Sel=%b | Output(result)=%b",
              $time, in, sel, result);
              
    in = 4'b0000; sel = 2'b00; #10;   
    in = 4'b0101; sel = 2'b00; #10;   
    in = 4'b1001; sel = 2'b00; #10;   
    in = 4'b1111; sel = 2'b00; #10;   

    in = 4'b0000; sel = 2'b01; #10;   
    in = 4'b0101; sel = 2'b01; #10;   
    in = 4'b1010; sel = 2'b01; #10;  
    in = 4'b1111; sel = 2'b01; #10;  

    in = 4'b0000; sel = 2'b10; #10;   
    in = 4'b0101; sel = 2'b10; #10;   
    in = 4'b1010; sel = 2'b10; #10;   
    in = 4'b1111; sel = 2'b10; #10;  

    #10 $finish;
end
endmodule