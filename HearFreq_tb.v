`timescale 1ns / 1ps

module HearFreq_tb;
    reg clk = 0;
    reg enable = 1;
    reg mic = 0;
    wire led;
    wire [2:0] command;
    
    localparam Fivehundred_Hz = 1_000_000;
    localparam One_kHz = 500_000;
    localparam OnePointFive_kHz = 333_333;
    
    HearFreq UUT(
        .clk(clk),
        .enable(enable),
        .mic(mic),
        .led(led),
        .command(command)
        );
        
//    WaveCount Bleh(
//        .clk(clk),
//        .enable(enable),
//        .mic(mic),
//        .frequency(frequency)    
//    );
    
    //always #Fivehundred_Hz mic = ~mic;      //500Hz wave simulation
    //always #One_kHz mic = ~mic;           //1000Hz wave simulation
    always #OnePointFive_kHz mic = ~mic;  //1500Hz wave simulation
    
    always #5 clk = ~clk;
endmodule
