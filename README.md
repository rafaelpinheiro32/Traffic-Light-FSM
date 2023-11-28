# Traffic-Light-FSM

Finite-state machine of a traffic light coded in Verilog.



The FSM consists in the states "off" (0), "stop" (1), "go" (2) and "slow" (3). The inputs are clk (free running clock), "pow" (power) and "str" (start). 
The outputs are "g" (green), "y" (yellow) and "r" (red), indicating the colors of the traffic lights currently turned on.
State transitions are synchronized with positive clock edges


The initial state is "stop", and it keeps at it as long as "pow" is low. When it goes high, state transitions to "stop", and keeps at stop while "str" is low.
When "str" goes high, state transitions to "go", "slow" and to "stop" again.

Diagram of FSM:

![image](https://github.com/rafaelpinheiro32/Traffic-Light-FSM/assets/151592512/c9a617b4-5978-42cb-90b9-0f76b7fe54ff)

Module file defines behavior of FSM, testbench file tests it.

Image of testfile waveforms:
![image](https://github.com/rafaelpinheiro32/Traffic-Light-FSM/assets/151592512/43b0f291-ba6f-48f6-a488-d3e8580900c2)

When "pow" goes high, state transitions to "stop", then transitions to "go" when "str" is high. When "pow" goes off when state is "slow", state goes to "off".
"pow" toggles and state goes back and forth from "off" to "stop".
