`timescale 1ns / 1ps

module FindSound_tb;
    reg clk = 0;
    reg enable = 1;
    reg LMic = 0;
    reg RMic = 0;
    wire [1:0] direction;
    
    localparam OnePointFive_kHz = 333_333;  //Simulate a 1500Hz wave
    
    reg [12:0] counter = 0; //Counter for when to initially change RMic
    reg [19:0] switchMic = 0;  //Counter for when to change RMic from now on
    
    FindSound UUT(
        .clk(clk),
        .enable(enable),
        .LMic(LMic),
        .RMic(RMic),
        .direction(direction)
    );
    
    always #OnePointFive_kHz LMic = ~LMic;  //1500Hz wave simulation
    always #5 clk = ~clk;
    
    always #1_000_000 enable = ~enable;     //See what happens when disabled
    
    always @(posedge clk)
    begin
        if(counter < 8_000) 
        begin
            counter = counter + 1;
        end
        else
        begin
            if(switchMic >= 33_333)   //Alternate RMic
            begin
                RMic = ~RMic;
                switchMic = switchMic - 33_333;
            end
            else
            begin
                switchMic = switchMic + 1; 
            end
        end
    end
endmodule
