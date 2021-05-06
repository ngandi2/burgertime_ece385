module ladder_rom
(
	input [18:0] address_a, address_b, 
	input clock, 
	output logic q_a, q_b
);

	// mem has width of 2 bits and a total of 261120 addresses
	logic mem [0:275199];

	initial
	begin
		$readmemh("ladders.txt", mem);
	end


	always_ff @ (posedge clock)
	begin
		q_a <= mem[address_a];
		q_b <= mem[address_b];
	end

endmodule
