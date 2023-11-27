`timescale 1ns / 1ps

module traffic_tb;
    reg CLK, POW, STR;
    wire G, Y, R;
    wire [1:0] CURST;
    
    traffic i0 (CLK, POW, STR, G, Y, R, CURST);
    
    always #5 CLK=~CLK;
    
    initial begin
        CLK = 0; POW=0; STR=0;
    end
    
    initial begin
        #20 POW = 1; //turn on
        #50 STR = 1; //begin next light cycle
        #10 STR = 0; //reset start signal
        #50 STR = 1; //check another light cycle
        #10 STR = 0; //reset start signal
        #10 POW = 0; //test power down
        #20 POW = 1; //test start after power down
        #40 POW = 0; //test power down from different state
        #20 POW = 1;
    end
    initial #300 $finish;

endmodule
