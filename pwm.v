`timescale 1ns / 1ps
//

module pwm(
    input clk,
    input enable,
    input [7:0] duty, // switches
    output reg pwmm
    );
    reg [7:0] counter;
    initial
    begin
        counter <= 0;
        pwmm <= 0;
    end
    
   always @ (posedge clk)
   begin
   if (enable)
       begin
        counter <= counter + 1;
        if (duty > counter)
          begin
           pwmm <= 1;
          end
        else
          begin
           pwmm <= 0;
          end
         
        end
     else
        begin
            pwmm <= 0;
            counter <= 0;
        end
        end
    
endmodule