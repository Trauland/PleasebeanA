module test_motors(
    input clk,
    input [15:0] sw,
    output [3:0] IN,
    output [1:0] EN);
    
    assign IN = sw[3:0];
        
    pwm u0
        (.clk(clk),
         .enable(sw[7]),
         .duty(sw[15:8]),
         .pwmm(EN[0]));
         
    pwm u1
        (.clk(clk),
         .enable(sw[6]),
         .duty(sw[15:8]),
         .pwmm(EN[1]));        
    
endmodule