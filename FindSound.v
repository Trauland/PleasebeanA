`timescale 1ns / 1ps

module FindSound(
    input clk,
    input enable,
    input LMic,
    input RMic,
    output reg [1:0] direction,
    output led2,
    output led
    );
    
    assign led = enable;
    assign led2 = ~(direction[0] || direction[1]);
    
    //Direction constants
    localparam nothing  = 2'b00;    //default/reset constant. This module is disabled
    localparam Right    = 2'b01;    //Sound is coming from the right
    localparam Left     = 2'b10;    //Sound is coming from the left
    
    reg oldRMic;
    
    initial 
	begin
		direction = 0;
		oldRMic = 1;
	end
    
    //This will effectively be a D Flip Flop with the right mic being the clock
    //  and the left mic being the input. If the right hears the sound first, the
    //  flip flop outputs one. If the left hears first, the flip flop outputs 0.
    
    always @(posedge clk)   //To be synchronous and prevent forcing a variable to be a clock 
    begin
        //When enabled
        if(enable == 1)
        begin
            //Only do something if the right mic chenges to HIGH (acts like clock)
            if(RMic == 1 && oldRMic == 0)
            begin
                direction <= (LMic == 1) ? Left : Right;
            end
            
            oldRMic <= RMic;    //Update oldRMic variable
        end
        //When disabled, reset all variables
        else
        begin
            oldRMic <= 1;
            direction <= nothing;
        end
    end
endmodule
