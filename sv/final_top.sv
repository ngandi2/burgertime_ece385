//-------------------------------------------------------------------------
//                                                                       --
//                                                                       --
//      For use with ECE 385 Lab 62                                       --
//      UIUC ECE Department                                              --
//-------------------------------------------------------------------------


module final_top (

	///////// Clocks /////////
	input     MAX10_CLK1_50, 
	
	///////// KEY /////////
	input    [ 1: 0]   KEY,
	
	///////// SW /////////
	input    [ 9: 0]   SW,
	
	///////// LEDR /////////
	output   [ 9: 0]   LEDR,
	
	///////// HEX /////////
	output   [ 7: 0]   HEX0,
	output   [ 7: 0]   HEX1,
	output   [ 7: 0]   HEX2,
	output   [ 7: 0]   HEX3,
	output   [ 7: 0]   HEX4,
	output   [ 7: 0]   HEX5,
	
	///////// SDRAM /////////
	output             DRAM_CLK,
	output             DRAM_CKE,
	output   [12: 0]   DRAM_ADDR,
	output   [ 1: 0]   DRAM_BA,
	inout    [15: 0]   DRAM_DQ,
	output             DRAM_LDQM,
	output             DRAM_UDQM,
	output             DRAM_CS_N,
	output             DRAM_WE_N,
	output             DRAM_CAS_N,
	output             DRAM_RAS_N,
	
	///////// VGA /////////
	output             VGA_HS,
	output             VGA_VS,
	output   [ 3: 0]   VGA_R,
	output   [ 3: 0]   VGA_G,
	output   [ 3: 0]   VGA_B,
	
	
	///////// ARDUINO /////////
	inout    [15: 0]   ARDUINO_IO,
	inout              ARDUINO_RESET_N 

);




logic Reset_h, vssig, blank, sync, VGA_Clk;


//=======================================================
//  REG/WIRE declarations
//=======================================================
	logic SPI0_CS_N, SPI0_SCLK, SPI0_MISO, SPI0_MOSI, USB_GPX, USB_IRQ, USB_RST;
	logic [3:0] hex_num_4, hex_num_3, hex_num_1, hex_num_0; //4 bit input hex digits
	logic [1:0] signs;
	logic [1:0] hundreds;
	logic [9:0] drawxsig, drawysig, ballxsig, ballysig, ballsizesig;
	logic [7:0] Red, Blue, Green;
	logic [7:0] keycode;

//=======================================================
//  Structural coding
//=======================================================
	assign ARDUINO_IO[10] = SPI0_CS_N;
	assign ARDUINO_IO[13] = SPI0_SCLK;
	assign ARDUINO_IO[11] = SPI0_MOSI;
	assign ARDUINO_IO[12] = 1'bZ;
	assign SPI0_MISO = ARDUINO_IO[12];
	
	assign ARDUINO_IO[9] = 1'bZ; 
	assign USB_IRQ = ARDUINO_IO[9];
		
	//Assignments specific to Circuits At Home UHS_20
	assign ARDUINO_RESET_N = USB_RST;
	assign ARDUINO_IO[7] = USB_RST;//USB reset 
	assign ARDUINO_IO[8] = 1'bZ; //this is GPX (set to input)
	assign USB_GPX = 1'b0;//GPX is not needed for standard USB host - set to 0 to prevent interrupt
	
	//Assign uSD CS to '1' to prevent uSD card from interfering with USB Host (if uSD card is plugged in)
	assign ARDUINO_IO[6] = 1'b1;
	
	//HEX drivers to convert numbers to HEX output
	HexDriver hex_driver4 (hex_num_4, HEX4[6:0]);
	assign HEX4[7] = 1'b1;
	
	HexDriver hex_driver3 (hex_num_3, HEX3[6:0]);
	assign HEX3[7] = 1'b1;
	
	HexDriver hex_driver1 (hex_num_1, HEX1[6:0]);
	assign HEX1[7] = 1'b1;
	
	HexDriver hex_driver0 (hex_num_0, HEX0[6:0]);
	assign HEX0[7] = 1'b1;
	
	//fill in the hundreds digit as well as the negative sign
	assign HEX5 = {1'b1, ~signs[1], 3'b111, ~hundreds[1], ~hundreds[1], 1'b1};
	assign HEX2 = {1'b1, ~signs[0], 3'b111, ~hundreds[0], ~hundreds[0], 1'b1};
	
	
	//Assign one button to reset
	assign {Reset_h}=~ (KEY[0]);

	//Our A/D converter is only 12 bit
	assign VGA_R = Red[7:4];
	assign VGA_B = Blue[7:4];
	assign VGA_G = Green[7:4];
	
	
	final_soc u0 (
	 	.clk_clk                           (MAX10_CLK1_50),  //clk.clk
	 	.reset_reset_n                     (1'b1),           //reset.reset_n
	 	.altpll_0_locked_conduit_export    (),               //altpll_0_locked_conduit.export
	 	.altpll_0_phasedone_conduit_export (),               //altpll_0_phasedone_conduit.export
	 	.altpll_0_areset_conduit_export    (),               //altpll_0_areset_conduit.export
	 	.key_external_connection_export    (KEY),            //key_external_connection.export

	 	//SDRAM
	 	.sdram_clk_clk(DRAM_CLK),                            //clk_sdram.clk
	 	.sdram_wire_addr(DRAM_ADDR),                         //sdram_wire.addr
	 	.sdram_wire_ba(DRAM_BA),                             //.ba
	 	.sdram_wire_cas_n(DRAM_CAS_N),                       //.cas_n
	 	.sdram_wire_cke(DRAM_CKE),                           //.cke
	 	.sdram_wire_cs_n(DRAM_CS_N),                         //.cs_n
	 	.sdram_wire_dq(DRAM_DQ),                             //.dq
	 	.sdram_wire_dqm({DRAM_UDQM,DRAM_LDQM}),              //.dqm
	 	.sdram_wire_ras_n(DRAM_RAS_N),                       //.ras_n
	 	.sdram_wire_we_n(DRAM_WE_N),                         //.we_n

	 	//USB SPI	
	 	.spi_0_SS_n(SPI0_CS_N),
	 	.spi_0_MOSI(SPI0_MOSI),
	 	.spi_0_MISO(SPI0_MISO),
	 	.spi_0_SCLK(SPI0_SCLK),
		
	 	//USB GPIO
	 	.usb_rst_export(USB_RST),
	 	.usb_irq_export(USB_IRQ),
	 	.usb_gpx_export(USB_GPX),
		
	 	//LEDs and HEX
	 	.hex_digits_export({hex_num_4, hex_num_3, hex_num_1, hex_num_0}),
	 	.leds_export({hundreds, signs, LEDR}),
	 	.keycode_export(keycode)
		
	);

	logic ingredient1_bottom_color, ingredient2_bottom_color, ladder_color_index_top, ladder_color_index_bottom;
	logic [1:0] stage_color_index;
	logic [2:0] sprite_color_index;
	logic [9:0] xcoord, ycoord, chef_xcoord, chef_ycoord, ingredient1_ycoord, ingredient1_xcoord, ingredient2_ycoord, ingredient2_xcoord;
	logic [9:0] burger1_topX, burger1_topY, burger1_LtopX, burger1_LtopY, burger1_PtopX, burger1_PtopY, burger1_BBtopX, burger1_BBtopY;
	logic [9:0] burger2_topX, burger2_topY, burger2_LtopX, burger2_LtopY, burger2_PtopX, burger2_PtopY, burger2_BBtopX, burger2_BBtopY;
	logic [9:0] burger3_topX, burger3_topY, burger3_LtopX, burger3_LtopY, burger3_PtopX, burger3_PtopY, burger3_BBtopX, burger3_BBtopY;
	logic [9:0] burger4_topX, burger4_topY, burger4_LtopX, burger4_LtopY, burger4_PtopX, burger4_PtopY, burger4_BBtopX, burger4_BBtopY;
	logic [9:0] spritesheet_x, spritesheet_y, spritesheet_xoffset, spritesheet_yoffset;
	logic chef;
	logic [16:0] ingredient_fall, ingredient1_falling, ingredient2_falling;

//instantiate a vga_controller, ball, and color_mapper here with the ports.
	vga_controller vga (
		.Clk(MAX10_CLK1_50), 
		.Reset(Reset_h), 
		.hs(VGA_HS), 
		.vs(VGA_VS), 
		.pixel_clk(VGA_Clk), 
		.blank(blank), 
		.sync(sync), 
		.DrawX(drawxsig), 
		.DrawY(drawysig)
	);

	color_mapper cmap (
		.DrawX(drawxsig), 
		.DrawY(drawysig), 
		.chef(chef), 
		.blank(blank),
		.stage_color_index(stage_color_index), 
		.sprite_color_index(sprite_color_index), 
		.Red(Red), 
		.Green(Green), 
		.Blue(Blue)
	);

	// state machine will determine these later on
	//assign spritesheet_x = 10'd16; // think like 1 * 16
	//assign spritesheet_y = 10'd0;
	// assign chef_xcoord = 0;
	// assign chef_ycoord = 0;
	
	chef chef_module (
		.Reset(Reset_h), 
		.frame_clk(VGA_VS), 
		.keycode(keycode), 
		.ChefX(chef_xcoord), 
		.ChefY(chef_ycoord), 
		.walk(|ladder_color_index_bottom), 
		.climb(&ladder_color_index_top)
	);
	
	ingredient #(.Burger_X_Start(32), .Burger_Y_Start(92), .Burger_Y_End(350)) burger1TopBun (
		.Reset(Reset_h), 
		.frame_clk(VGA_VS), 
		.ChefX(chef_xcoord), 
		.ChefY(chef_ycoord), 
		.aboveIngredientX(10'd0), 
		.aboveIngredientY(10'd0), 
		.fall((~ingredient1_bottom_color & ingredient1_falling[15]) | (~ingredient2_bottom_color & ingredient2_falling[15])), 
		.BurgerX(burger1_topX), 
		.BurgerY(burger1_topY), 
		.falling(ingredient_fall[15])
	);

	ingredient #(.Burger_X_Start(32), .Burger_Y_Start(156), .Burger_Y_End(366)) burger1Lettuce (
		.Reset(Reset_h), 
		.frame_clk(VGA_VS), 
		.ChefX(chef_xcoord), 
		.ChefY(chef_ycoord), 
		.aboveIngredientX(burger1_topX), 
		.aboveIngredientY(burger1_topY), 
		.fall((~ingredient1_bottom_color & ingredient1_falling[14]) | (~ingredient2_bottom_color & ingredient2_falling[14])), 
		.BurgerX(burger1_LtopX), 
		.BurgerY(burger1_LtopY), 
		.falling(ingredient_fall[14])
	);

	ingredient #(.Burger_X_Start(32), .Burger_Y_Start(252), .Burger_Y_End(382)) burger1Patty (
		.Reset(Reset_h), 
		.frame_clk(VGA_VS), 
		.ChefX(chef_xcoord), 
		.ChefY(chef_ycoord), 
		.aboveIngredientX(burger1_LtopX), 
		.aboveIngredientY(burger1_LtopY), 
		.fall((~ingredient1_bottom_color & ingredient1_falling[13]) | (~ingredient2_bottom_color & ingredient2_falling[13])), 
		.BurgerX(burger1_PtopX), 
		.BurgerY(burger1_PtopY), 
		.falling(ingredient_fall[13])
	);

	ingredient #(.Burger_X_Start(32), .Burger_Y_Start(316), .Burger_Y_End(398)) burger1BotBun (
		.Reset(Reset_h), 
		.frame_clk(VGA_VS), 
		.ChefX(chef_xcoord), 
		.ChefY(chef_ycoord), 
		.aboveIngredientX(burger1_PtopX), 
		.aboveIngredientY(burger1_PtopY), 
		.fall((~ingredient1_bottom_color & ingredient1_falling[12]) | (~ingredient2_bottom_color & ingredient2_falling[12])), 
		.BurgerX(burger1_BBtopX), 
		.BurgerY(burger1_BBtopY), 
		.falling(ingredient_fall[12])
	);

	ingredient #(.Burger_X_Start(128), .Burger_Y_Start(28), .Burger_Y_End(350)) burger2TopBun (
		.Reset(Reset_h), 
		.frame_clk(VGA_VS), 
		.ChefX(chef_xcoord), 
		.ChefY(chef_ycoord), 
		.aboveIngredientX(10'd0), 
		.aboveIngredientY(10'd0), 
		.fall((~ingredient1_bottom_color & ingredient1_falling[11]) | (~ingredient2_bottom_color & ingredient2_falling[11])), 
		.BurgerX(burger2_topX), 
		.BurgerY(burger2_topY), 
		.falling(ingredient_fall[11])
	);

	ingredient #(.Burger_X_Start(128), .Burger_Y_Start(188), .Burger_Y_End(366)) burger2Lettuce (
		.Reset(Reset_h), 
		.frame_clk(VGA_VS), 
		.ChefX(chef_xcoord), 
		.ChefY(chef_ycoord), 
		.aboveIngredientX(burger2_topX), 
		.aboveIngredientY(burger2_topY), 
		.fall((~ingredient1_bottom_color & ingredient1_falling[10]) | (~ingredient2_bottom_color & ingredient2_falling[10])), 
		.BurgerX(burger2_LtopX), 
		.BurgerY(burger2_LtopY), 
		.falling(ingredient_fall[10])
	);

	ingredient #(.Burger_X_Start(128), .Burger_Y_Start(252), .Burger_Y_End(382)) burger2Patty (
		.Reset(Reset_h), 
		.frame_clk(VGA_VS), 
		.ChefX(chef_xcoord), 
		.ChefY(chef_ycoord), 
		.aboveIngredientX(burger2_LtopX), 
		.aboveIngredientY(burger2_LtopY), 
		.fall((~ingredient1_bottom_color & ingredient1_falling[9]) | (~ingredient2_bottom_color & ingredient2_falling[9])), 
		.BurgerX(burger2_PtopX), 
		.BurgerY(burger2_PtopY), 
		.falling(ingredient_fall[9])
	);

	ingredient #(.Burger_X_Start(128), .Burger_Y_Start(316), .Burger_Y_End(398)) burger2BotBun (
		.Reset(Reset_h), 
		.frame_clk(VGA_VS), 
		.ChefX(chef_xcoord), 
		.ChefY(chef_ycoord), 
		.aboveIngredientX(burger2_PtopX), 
		.aboveIngredientY(burger2_PtopY), 
		.fall((~ingredient1_bottom_color & ingredient1_falling[8]) | (~ingredient2_bottom_color & ingredient2_falling[8])), 
		.BurgerX(burger2_BBtopX), 
		.BurgerY(burger2_BBtopY), 
		.falling(ingredient_fall[8])
	);

	ingredient #(.Burger_X_Start(224), .Burger_Y_Start(28), .Burger_Y_End(350)) burger3TopBun (
		.Reset(Reset_h), 
		.frame_clk(VGA_VS), 
		.ChefX(chef_xcoord), 
		.ChefY(chef_ycoord), 
		.aboveIngredientX(10'd0), 
		.aboveIngredientY(10'd0), 
		.fall((~ingredient1_bottom_color & ingredient1_falling[7]) | (~ingredient2_bottom_color & ingredient2_falling[7])), 
		.BurgerX(burger3_topX), 
		.BurgerY(burger3_topY), 
		.falling(ingredient_fall[7])
	);

	ingredient #(.Burger_X_Start(224), .Burger_Y_Start(92), .Burger_Y_End(366)) burger3Lettuce (
		.Reset(Reset_h), 
		.frame_clk(VGA_VS), 
		.ChefX(chef_xcoord), 
		.ChefY(chef_ycoord), 
		.aboveIngredientX(burger3_topX), 
		.aboveIngredientY(burger3_topY), 
		.fall((~ingredient1_bottom_color & ingredient1_falling[6]) | (~ingredient2_bottom_color & ingredient2_falling[6])), 
		.BurgerX(burger3_LtopX), 
		.BurgerY(burger3_LtopY), 
		.falling(ingredient_fall[6])
	);

	ingredient #(.Burger_X_Start(224), .Burger_Y_Start(188), .Burger_Y_End(382)) burger3Patty (
		.Reset(Reset_h), 
		.frame_clk(VGA_VS), 
		.ChefX(chef_xcoord), 
		.ChefY(chef_ycoord), 
		.aboveIngredientX(burger3_LtopX), 
		.aboveIngredientY(burger3_LtopY), 
		.fall((~ingredient1_bottom_color & ingredient1_falling[5]) | (~ingredient2_bottom_color & ingredient2_falling[5])), 
		.BurgerX(burger3_PtopX), 
		.BurgerY(burger3_PtopY), 
		.falling(ingredient_fall[5])
	);

	ingredient #(.Burger_X_Start(224), .Burger_Y_Start(316), .Burger_Y_End(398)) burger3BotBun (
		.Reset(Reset_h), 
		.frame_clk(VGA_VS), 
		.ChefX(chef_xcoord), 
		.ChefY(chef_ycoord), 
		.aboveIngredientX(burger3_PtopX), 
		.aboveIngredientY(burger3_PtopY), 
		.fall((~ingredient1_bottom_color & ingredient1_falling[4]) | (~ingredient2_bottom_color & ingredient2_falling[4])), 
		.BurgerX(burger3_BBtopX), 
		.BurgerY(burger3_BBtopY), 
		.falling(ingredient_fall[4])
	);

	ingredient #(.Burger_X_Start(320), .Burger_Y_Start(28), .Burger_Y_End(350)) burger4TopBun (
		.Reset(Reset_h), 
		.frame_clk(VGA_VS), 
		.ChefX(chef_xcoord), 
		.ChefY(chef_ycoord), 
		.aboveIngredientX(10'd0), 
		.aboveIngredientY(10'd0), 
		.fall((~ingredient1_bottom_color & ingredient1_falling[3]) | (~ingredient2_bottom_color & ingredient2_falling[3])), 
		.BurgerX(burger4_topX), 
		.BurgerY(burger4_topY), 
		.falling(ingredient_fall[3])
	);

	ingredient #(.Burger_X_Start(320), .Burger_Y_Start(92), .Burger_Y_End(366)) burger4Lettuce (
		.Reset(Reset_h), 
		.frame_clk(VGA_VS), 
		.ChefX(chef_xcoord), 
		.ChefY(chef_ycoord), 
		.aboveIngredientX(burger4_topX), 
		.aboveIngredientY(burger4_topY), 
		.fall((~ingredient1_bottom_color & ingredient1_falling[2]) | (~ingredient2_bottom_color & ingredient2_falling[2])), 
		.BurgerX(burger4_LtopX), 
		.BurgerY(burger4_LtopY), 
		.falling(ingredient_fall[2])
	);

	ingredient #(.Burger_X_Start(320), .Burger_Y_Start(156), .Burger_Y_End(382)) burger4Patty (
		.Reset(Reset_h), 
		.frame_clk(VGA_VS), 
		.ChefX(chef_xcoord), 
		.ChefY(chef_ycoord), 
		.aboveIngredientX(burger4_LtopX), 
		.aboveIngredientY(burger4_LtopY), 
		.fall((~ingredient1_bottom_color & ingredient1_falling[1]) | (~ingredient2_bottom_color & ingredient2_falling[1])), 
		.BurgerX(burger4_PtopX), 
		.BurgerY(burger4_PtopY), 
		.falling(ingredient_fall[1])
	);

	ingredient #(.Burger_X_Start(320), .Burger_Y_Start(220), .Burger_Y_End(398)) burger4BotBun (
		.Reset(Reset_h), 
		.frame_clk(VGA_VS), 
		.ChefX(chef_xcoord), 
		.ChefY(chef_ycoord), 
		.aboveIngredientX(burger4_PtopX), 
		.aboveIngredientY(burger4_PtopY), 
		.fall((~ingredient1_bottom_color & ingredient1_falling[0]) | (~ingredient2_bottom_color & ingredient2_falling[0])), 
		.BurgerX(burger4_BBtopX), 
		.BurgerY(burger4_BBtopY), 
		.falling(ingredient_fall[0])
	);

	// the ingredient coordinates should be defined by a mux or something later
	fall_ram_logic ingredient_fall_ram_logic (
		.clock(VGA_VS), 
		.Reset(Reset_h), 
		.ingredient_fall(ingredient_fall), 
		.ingredient1_falling(ingredient1_falling), 
		.ingredient2_falling(ingredient2_falling), 
		.ingredient1_ycoord(ingredient1_ycoord), 
		.ingredient1_xcoord(ingredient1_xcoord), 
		.ingredient2_ycoord(ingredient2_ycoord), 
		.ingredient2_xcoord(ingredient2_xcoord), 
		.*
	);
	
	spritesheet sprite_offsets (
		.drawxsig(drawxsig), 
		.drawysig(drawysig), 
		.chef_xcoord(chef_xcoord), 
		.chef_ycoord(chef_ycoord), 
		.xcoord(xcoord), 
		.ycoord(ycoord), 
		.spritesheet_x(spritesheet_x), 
		.spritesheet_y(spritesheet_y), 
		.spritesheet_xoffset(spritesheet_xoffset), 
		.spritesheet_yoffset(spritesheet_yoffset),
		.chef(chef), 
		.sprite_color_index(sprite_color_index), 
		.*
	);
	
	stage_ram stages (
		.data(), 
		.address(ycoord * 640 + xcoord), 
		.wren(1'b0), 
		.clock(MAX10_CLK1_50), 
		.q(stage_color_index)
	);

	// ['0x000000', '0x0000FF'] = [background, floor/ladders]
	ladder_ram ladders (
		.address_a(chef_ycoord * 640 + (chef_xcoord + 8)), 
		.address_b((chef_ycoord + 16) * 640 + (chef_xcoord + 8)), 
		.clock(MAX10_CLK1_50), 
		.data_a(), 
		.data_b(), 
		.wren_a(1'b0), 
		.wren_b(1'b0), 
		.q_a(ladder_color_index_top), 
		.q_b(ladder_color_index_bottom)
	);

	// ['0x000000', '0x0000FF'] = [background/ladders, floor]
	stage_bound_ram ingredient_bound (
		.address_a((ingredient1_ycoord + 6) * 640 + (ingredient1_xcoord + 16)), 
		.address_b((ingredient2_ycoord + 6) * 640 + (ingredient2_xcoord + 16)), 
		.clock(MAX10_CLK1_50), 
		.data_a(), 
		.data_b(), 
		.wren_a(1'b0), 
		.wren_b(1'b0), 
		.q_a(ingredient1_bottom_color), 
		.q_b(ingredient2_bottom_color)
	);
	
	sprite_ram sprites (
		.data(), 
		.address((spritesheet_y + spritesheet_yoffset) * 240 + spritesheet_x + spritesheet_xoffset), 
		.wren(1'b0), 
		.clock(MAX10_CLK1_50), 
		.q(sprite_color_index)
	);

endmodule
