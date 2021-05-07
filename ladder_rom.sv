module ladder_rom
(
	input [18:0] address_1, address_2, address_3, address_4, address_5, address_6, address_7, address_8, address_9, address_10, 
	input clock, 
	output logic q_1, q_2, q_3, q_4, q_5, q_6, q_7, q_8, q_9, q_10
);

	// mem has width of 2 bits and a total of 261120 addresses
	logic mem [0:275199];

	initial
	begin
		$readmemh("ladders.txt", mem);
	end


	always_ff @ (posedge clock)
	begin
		q_1 <= mem[address_1];
		q_2 <= mem[address_2];
		q_3 <= mem[address_3];
		q_4 <= mem[address_4];
		q_5 <= mem[address_5];
		q_6 <= mem[address_6];
		q_7 <= mem[address_7];
		q_8 <= mem[address_8];
		q_9 <= mem[address_9];
		q_10 <= mem[address_10];
	end

endmodule
