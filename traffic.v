`timescale 1ns / 1ps


module traffic(
    input clk,
    input pow,
    input str,
    output reg g=0,
    output reg y=0,
    output reg r=0,
    output reg [1:0] curst = 0
    );
    reg [1:0] nxtst;
    parameter off = 0;
    parameter stop = 1;
    parameter go = 2;
    parameter slow = 3;
    
    always @ (posedge clk)
        curst <= nxtst; // next state -> current state
        
    always @ (*)
        begin case (curst)
            off: if (!pow) nxtst <= off;
                    else nxtst <= stop;
            stop: if (!pow) nxtst <= off;
                    else if (!str) nxtst <= stop;
                        else nxtst <= go;
            go: if (!pow) nxtst <= off;
                    else nxtst <= slow; 
            slow: if (!pow) nxtst <= off;
                    else nxtst <= stop;
     endcase end
                    
     always @ (curst)
        case (curst)
            off: begin r=0; g=0; y=0; end
            stop: begin r=1; g=0; y=0; end
            go: begin r=0; g=1; y=0; end
            slow: begin r=0; g=0; y=1; end
        endcase
    
endmodule
