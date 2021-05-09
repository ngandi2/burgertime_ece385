module testbench();

timeunit 10ns;

timeprecision 1ns;

// These signals are internal because the processor will be 
// instantiated as a submodule in testbench.
logic clock = 0;
logic reset;
logic lives;
logic burger_done;
logic [7:0] keycode;
logic [1:0] c_state;
logic game_start;
logic game_win;
logic game_lose;
logic game_idle;


game_control control(.*);

always_comb 
begin	
	c_state = control.state;
end


// Toggle the clock
// #1 means wait for a delay of 1 timeunit
always begin : CLOCK_GENERATION
#1 clock = ~clock;
end

initial begin: CLOCK_INITIALIZATION
	clock = 0;
end 

// Testing begins here
// The initial block is not synthesizable
// Everything happens sequentially inside an initial block
// as in a software program
initial begin: TEST_VECTORS
reset = 0;        // Toggle Reset

reset = 1;        // Toggle Reset

lives = 1;
burger_done = 0;

#0 reset = 1;
#4 reset = 0;

#20 keycode = 8'd44;

#20 lives = 0;

#20 keycode = 8'd40;

end
endmodule