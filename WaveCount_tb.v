`timescale 1ns / 1ps

module WaveCount_tb;
    localparam Fivehundred_Hz = 1_000_000;
    localparam One_kHz = 500_000;
    localparam OnePointFive_kHz = 333_333;
    
    reg clk = 0;
    reg enable = 1;
    reg mic = 0;
    wire [1:0] frequency;
    
    WaveCount UUT(
        .clk(clk),
        .enable(enable),
        .mic(mic),
        .frequency(frequency)
        );
    
    always #5 clk = ~clk;
    
    //always #Fivehundred_Hz mic = ~mic;      //500Hz wave simulation
    //always #One_kHz mic = ~mic;           //1000Hz wave simulation
    always #OnePointFive_kHz mic = ~mic;  //1500Hz wave simulation
endmodule
