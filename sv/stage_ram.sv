// /*
//  * ECE385-HelperTools/PNG-To-Txt
//  * Author: Rishi Thakkar
//  *
//  */

// module stageRAM
// (
// 	input [1:0] data_In,
// 	input [18:0] write_address, read_address,
// 	input we, Clk,
// 	output logic [1:0] data_Out
// );

// // mem has width of 2 bits and a total of 261120 addresses
// // ['0x000000', '0xFFFFFF', '0x0000FF', '0xB6B6AA']
// logic [1:0] mem [0:261119];

// initial
// begin
// 	 $readmemh("sprite_bytes/stages.txt", mem);
// end


// always_ff @ (posedge Clk) begin
// 	if (we)
// 		mem[write_address] <= data_In;
// 	if(read_address < 261120)
// 		data_Out <= mem[read_address];
// 	else
// 		data_Out <= '0;
// end

// endmodule
