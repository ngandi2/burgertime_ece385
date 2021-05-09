module fall_ram_logic (
  input logic clock, Reset, 
  input logic [16:0] ingredient_fall, 
  input logic [9:0] burger1_topX, burger1_topY, burger1_LtopX, burger1_LtopY, burger1_PtopX, burger1_PtopY, burger1_BBtopX, burger1_BBtopY, 
  input logic [9:0] burger2_topX, burger2_topY, burger2_LtopX, burger2_LtopY, burger2_PtopX, burger2_PtopY, burger2_BBtopX, burger2_BBtopY, 
  input logic [9:0] burger3_topX, burger3_topY, burger3_LtopX, burger3_LtopY, burger3_PtopX, burger3_PtopY, burger3_BBtopX, burger3_BBtopY, 
  input logic [9:0] burger4_topX, burger4_topY, burger4_LtopX, burger4_LtopY, burger4_PtopX, burger4_PtopY, burger4_BBtopX, burger4_BBtopY, 
  output logic [16:0] ingredient1_falling, ingredient2_falling, 
  output logic [9:0] ingredient1_ycoord, ingredient1_xcoord, ingredient2_ycoord, ingredient2_xcoord
);

always_ff @ (posedge clock)
	begin
		if (Reset)
		begin
			ingredient1_ycoord <= 10'd92;
			ingredient1_xcoord <= 10'd32;
      ingredient2_ycoord <= 10'd92;
			ingredient2_xcoord <= 10'd32;
			ingredient1_falling <= '0;
      ingredient2_falling <= '0;
		end
		case (ingredient_fall)
			16'h8000: 
			begin
				ingredient1_ycoord <= burger1_topY;
				ingredient1_xcoord <= burger1_topX;
        ingredient2_ycoord <= 10'd92;
        ingredient2_xcoord <= 10'd32;
        ingredient1_falling <= 16'h8000;
        ingredient2_falling <= '0;
			end
			16'h4000: 
			begin
				ingredient1_ycoord <= burger1_LtopY;
				ingredient1_xcoord <= burger1_LtopX;
        ingredient2_ycoord <= 10'd92;
        ingredient2_xcoord <= 10'd32;
        ingredient1_falling <= 16'h4000;
        ingredient2_falling <= '0;
			end
			16'h2000: 
			begin
				ingredient1_ycoord <= burger1_PtopY;
				ingredient1_xcoord <= burger1_PtopX;
        ingredient2_ycoord <= 10'd92;
        ingredient2_xcoord <= 10'd32;
        ingredient1_falling <= 16'h2000;
        ingredient2_falling <= '0;
			end
			16'h1000: 
			begin
				ingredient1_ycoord <= burger1_BBtopY;
				ingredient1_xcoord <= burger1_BBtopX;
        ingredient2_ycoord <= 10'd92;
        ingredient2_xcoord <= 10'd32;
        ingredient1_falling <= 16'h1000;
        ingredient2_falling <= '0;
			end
			16'h0800: 
			begin
				ingredient1_ycoord <= burger2_topY;
				ingredient1_xcoord <= burger2_topX;
        ingredient2_ycoord <= 10'd92;
        ingredient2_xcoord <= 10'd32;
        ingredient1_falling <= 16'h0800;
        ingredient2_falling <= '0;
			end
			16'h0400: 
			begin
				ingredient1_ycoord <= burger2_LtopY;
				ingredient1_xcoord <= burger2_LtopX;
        ingredient2_ycoord <= 10'd92;
        ingredient2_xcoord <= 10'd32;
        ingredient1_falling <= 16'h0400;
        ingredient2_falling <= '0;
			end
			16'h0200: 
			begin
				ingredient1_ycoord <= burger2_PtopY;
				ingredient1_xcoord <= burger2_PtopX;
        ingredient2_ycoord <= 10'd92;
        ingredient2_xcoord <= 10'd32;
        ingredient1_falling <= 16'h0200;
        ingredient2_falling <= '0;
			end
			16'h0100: 
			begin
				ingredient1_ycoord <= burger2_BBtopY;
				ingredient1_xcoord <= burger2_BBtopX;
        ingredient2_ycoord <= 10'd92;
        ingredient2_xcoord <= 10'd32;
        ingredient1_falling <= 16'h0100;
        ingredient2_falling <= '0;
			end
			16'h0080: 
			begin
				ingredient1_ycoord <= burger3_topY;
				ingredient1_xcoord <= burger3_topX;
        ingredient2_ycoord <= 10'd92;
        ingredient2_xcoord <= 10'd32;
        ingredient1_falling <= 16'h0080;
        ingredient2_falling <= '0;
			end
			16'h0040: 
			begin
				ingredient1_ycoord <= burger3_LtopY;
				ingredient1_xcoord <= burger3_LtopX;
        ingredient2_ycoord <= 10'd92;
        ingredient2_xcoord <= 10'd32;
        ingredient1_falling <= 16'h0040;
        ingredient2_falling <= '0;
			end
			16'h0020: 
			begin
				ingredient1_ycoord <= burger3_PtopY;
				ingredient1_xcoord <= burger3_PtopX;
        ingredient2_ycoord <= 10'd92;
        ingredient2_xcoord <= 10'd32;
        ingredient1_falling <= 16'h0020;
        ingredient2_falling <= '0;
			end
			16'h0010: 
			begin
				ingredient1_ycoord <= burger3_BBtopY;
				ingredient1_xcoord <= burger3_BBtopX;
        ingredient2_ycoord <= 10'd92;
        ingredient2_xcoord <= 10'd32;
        ingredient1_falling <= 16'h0010;
        ingredient2_falling <= '0;
			end
			16'h0008: 
			begin
				ingredient1_ycoord <= burger4_topY;
				ingredient1_xcoord <= burger4_topX;
        ingredient2_ycoord <= 10'd92;
        ingredient2_xcoord <= 10'd32;
        ingredient1_falling <= 16'h0008;
        ingredient2_falling <= '0;
			end
			16'h0004: 
			begin
				ingredient1_ycoord <= burger4_LtopY;
				ingredient1_xcoord <= burger4_LtopX;
        ingredient2_ycoord <= 10'd92;
        ingredient2_xcoord <= 10'd32;
				ingredient1_falling <= 16'h0004;
        ingredient2_falling <= '0;
			end
			16'h0002: 
			begin
				ingredient1_ycoord <= burger4_PtopY;
				ingredient1_xcoord <= burger4_PtopX;
        ingredient2_ycoord <= 10'd92;
        ingredient2_xcoord <= 10'd32;
				ingredient1_falling <= 16'h0002;
        ingredient2_falling <= '0;
			end
			16'h0001: 
			begin
				ingredient1_ycoord <= burger4_BBtopY;
				ingredient1_xcoord <= burger4_BBtopX;
        ingredient2_ycoord <= 10'd92;
        ingredient2_xcoord <= 10'd32;
				ingredient1_falling <= 16'h0001;
        ingredient2_falling <= '0;
			end

      16'h8800: 
			begin
				ingredient1_ycoord <= burger1_topY;
				ingredient1_xcoord <= burger1_topX;
        ingredient2_ycoord <= burger2_topY;
        ingredient2_xcoord <= burger2_topX;
				ingredient1_falling <= 16'h8000;
        ingredient2_falling <= 16'h0800;
			end
			16'h4800: 
			begin
				ingredient1_ycoord <= burger1_LtopY;
				ingredient1_xcoord <= burger1_LtopX;
        ingredient2_ycoord <= burger2_topY;
        ingredient2_xcoord <= burger2_topX;
				ingredient1_falling <= 16'h4000;
        ingredient2_falling <= 16'h0800;
			end
			16'h2800: 
			begin
				ingredient1_ycoord <= burger1_PtopY;
				ingredient1_xcoord <= burger1_PtopX;
        ingredient2_ycoord <= burger2_topY;
        ingredient2_xcoord <= burger2_topX;
				ingredient1_falling <= 16'h2000;
        ingredient2_falling <= 16'h0800;
			end
			16'h1800: 
			begin
				ingredient1_ycoord <= burger1_BBtopY;
				ingredient1_xcoord <= burger1_BBtopX;
        ingredient2_ycoord <= burger2_topY;
        ingredient2_xcoord <= burger2_topX;
				ingredient1_falling <= 16'h1000;
        ingredient2_falling <= 16'h0800;
			end

      16'h8400: 
			begin
				ingredient1_ycoord <= burger1_topY;
				ingredient1_xcoord <= burger1_topX;
        ingredient2_ycoord <= burger2_LtopY;
        ingredient2_xcoord <= burger2_LtopX;
				ingredient1_falling <= 16'h8000;
        ingredient2_falling <= 16'h0400;
			end
			16'h4400: 
			begin
				ingredient1_ycoord <= burger1_LtopY;
				ingredient1_xcoord <= burger1_LtopX;
        ingredient2_ycoord <= burger2_LtopY;
        ingredient2_xcoord <= burger2_LtopX;
				ingredient1_falling <= 16'h4000;
        ingredient2_falling <= 16'h0400;
			end
			16'h2400: 
			begin
				ingredient1_ycoord <= burger1_PtopY;
				ingredient1_xcoord <= burger1_PtopX;
        ingredient2_ycoord <= burger2_LtopY;
        ingredient2_xcoord <= burger2_LtopX;
				ingredient1_falling <= 16'h2000;
        ingredient2_falling <= 16'h0400;
			end
			16'h1400: 
			begin
				ingredient1_ycoord <= burger1_BBtopY;
				ingredient1_xcoord <= burger1_BBtopX;
        ingredient2_ycoord <= burger2_LtopY;
        ingredient2_xcoord <= burger2_LtopX;
				ingredient1_falling <= 16'h1000;
        ingredient2_falling <= 16'h0400;
			end

      16'h8200: 
			begin
				ingredient1_ycoord <= burger1_topY;
				ingredient1_xcoord <= burger1_topX;
        ingredient2_ycoord <= burger2_PtopY;
        ingredient2_xcoord <= burger2_PtopX;
				ingredient1_falling <= 16'h8000;
        ingredient2_falling <= 16'h0200;
			end
			16'h4200: 
			begin
				ingredient1_ycoord <= burger1_LtopY;
				ingredient1_xcoord <= burger1_LtopX;
        ingredient2_ycoord <= burger2_PtopY;
        ingredient2_xcoord <= burger2_PtopX;
				ingredient1_falling <= 16'h4000;
        ingredient2_falling <= 16'h0200;
			end
			16'h2200: 
			begin
				ingredient1_ycoord <= burger1_PtopY;
				ingredient1_xcoord <= burger1_PtopX;
        ingredient2_ycoord <= burger2_PtopY;
        ingredient2_xcoord <= burger2_PtopX;
				ingredient1_falling <= 16'h2000;
        ingredient2_falling <= 16'h0200;
			end
			16'h1200: 
			begin
				ingredient1_ycoord <= burger1_BBtopY;
				ingredient1_xcoord <= burger1_BBtopX;
        ingredient2_ycoord <= burger2_PtopY;
        ingredient2_xcoord <= burger2_PtopX;
				ingredient1_falling <= 16'h1000;
        ingredient2_falling <= 16'h0200;
			end

      16'h8100: 
			begin
				ingredient1_ycoord <= burger1_topY;
				ingredient1_xcoord <= burger1_topX;
        ingredient2_ycoord <= burger2_BBtopY;
        ingredient2_xcoord <= burger2_BBtopX;
				ingredient1_falling <= 16'h8000;
        ingredient2_falling <= 16'h0100;
			end
			16'h4100: 
			begin
				ingredient1_ycoord <= burger1_LtopY;
				ingredient1_xcoord <= burger1_LtopX;
        ingredient2_ycoord <= burger2_BBtopY;
        ingredient2_xcoord <= burger2_BBtopX;
				ingredient1_falling <= 16'h4000;
        ingredient2_falling <= 16'h0100;
			end
			16'h2100: 
			begin
				ingredient1_ycoord <= burger1_PtopY;
				ingredient1_xcoord <= burger1_PtopX;
        ingredient2_ycoord <= burger2_BBtopY;
        ingredient2_xcoord <= burger2_BBtopX;
				ingredient1_falling <= 16'h2000;
        ingredient2_falling <= 16'h0100;
			end
			16'h1100: 
			begin
				ingredient1_ycoord <= burger1_BBtopY;
				ingredient1_xcoord <= burger1_BBtopX;
        ingredient2_ycoord <= burger2_BBtopY;
        ingredient2_xcoord <= burger2_BBtopX;
				ingredient1_falling <= 16'h1000;
        ingredient2_falling <= 16'h0100;
			end

      16'h8080: 
			begin
				ingredient1_ycoord <= burger1_topY;
				ingredient1_xcoord <= burger1_topX;
        ingredient2_ycoord <= burger3_topY;
        ingredient2_xcoord <= burger3_topX;
				ingredient1_falling <= 16'h8000;
        ingredient2_falling <= 16'h0080;
			end
			16'h4080: 
			begin
				ingredient1_ycoord <= burger1_LtopY;
				ingredient1_xcoord <= burger1_LtopX;
        ingredient2_ycoord <= burger3_topY;
        ingredient2_xcoord <= burger3_topX;
				ingredient1_falling <= 16'h4000;
        ingredient2_falling <= 16'h0080;
			end
			16'h2080: 
			begin
				ingredient1_ycoord <= burger1_PtopY;
				ingredient1_xcoord <= burger1_PtopX;
        ingredient2_ycoord <= burger3_topY;
        ingredient2_xcoord <= burger3_topX;
				ingredient1_falling <= 16'h2000;
        ingredient2_falling <= 16'h0080;
			end
			16'h1080: 
			begin
				ingredient1_ycoord <= burger1_BBtopY;
				ingredient1_xcoord <= burger1_BBtopX;
        ingredient2_ycoord <= burger3_topY;
        ingredient2_xcoord <= burger3_topX;
				ingredient1_falling <= 16'h1000;
        ingredient2_falling <= 16'h0080;
			end

      16'h8040: 
			begin
				ingredient1_ycoord <= burger1_topY;
				ingredient1_xcoord <= burger1_topX;
        ingredient2_ycoord <= burger3_LtopY;
        ingredient2_xcoord <= burger3_LtopX;
				ingredient1_falling <= 16'h8000;
        ingredient2_falling <= 16'h0040;
			end
			16'h4040: 
			begin
				ingredient1_ycoord <= burger1_LtopY;
				ingredient1_xcoord <= burger1_LtopX;
        ingredient2_ycoord <= burger3_LtopY;
        ingredient2_xcoord <= burger3_LtopX;
				ingredient1_falling <= 16'h4000;
        ingredient2_falling <= 16'h0040;
			end
			16'h2040: 
			begin
				ingredient1_ycoord <= burger1_PtopY;
				ingredient1_xcoord <= burger1_PtopX;
        ingredient2_ycoord <= burger3_LtopY;
        ingredient2_xcoord <= burger3_LtopX;
				ingredient1_falling <= 16'h2000;
        ingredient2_falling <= 16'h0040;
			end
			16'h1040: 
			begin
				ingredient1_ycoord <= burger1_BBtopY;
				ingredient1_xcoord <= burger1_BBtopX;
        ingredient2_ycoord <= burger3_LtopY;
        ingredient2_xcoord <= burger3_LtopX;
				ingredient1_falling <= 16'h1000;
        ingredient2_falling <= 16'h0040;
			end

      16'h8020: 
			begin
				ingredient1_ycoord <= burger1_topY;
				ingredient1_xcoord <= burger1_topX;
        ingredient2_ycoord <= burger3_PtopY;
        ingredient2_xcoord <= burger3_PtopX;
				ingredient1_falling <= 16'h8000;
        ingredient2_falling <= 16'h0020;
			end
			16'h4020: 
			begin
				ingredient1_ycoord <= burger1_LtopY;
				ingredient1_xcoord <= burger1_LtopX;
        ingredient2_ycoord <= burger3_PtopY;
        ingredient2_xcoord <= burger3_PtopX;
				ingredient1_falling <= 16'h4000;
        ingredient2_falling <= 16'h0020;
			end
			16'h2020: 
			begin
				ingredient1_ycoord <= burger1_PtopY;
				ingredient1_xcoord <= burger1_PtopX;
        ingredient2_ycoord <= burger3_PtopY;
        ingredient2_xcoord <= burger3_PtopX;
				ingredient1_falling <= 16'h2000;
        ingredient2_falling <= 16'h0020;
			end
			16'h1020: 
			begin
				ingredient1_ycoord <= burger1_BBtopY;
				ingredient1_xcoord <= burger1_BBtopX;
        ingredient2_ycoord <= burger3_PtopY;
        ingredient2_xcoord <= burger3_PtopX;
				ingredient1_falling <= 16'h1000;
        ingredient2_falling <= 16'h0020;
			end

      16'h8010: 
			begin
				ingredient1_ycoord <= burger1_topY;
				ingredient1_xcoord <= burger1_topX;
        ingredient2_ycoord <= burger3_BBtopY;
        ingredient2_xcoord <= burger3_BBtopX;
				ingredient1_falling <= 16'h8000;
        ingredient2_falling <= 16'h0010;
			end
			16'h4010: 
			begin
				ingredient1_ycoord <= burger1_LtopY;
				ingredient1_xcoord <= burger1_LtopX;
        ingredient2_ycoord <= burger3_BBtopY;
        ingredient2_xcoord <= burger3_BBtopX;
				ingredient1_falling <= 16'h4000;
        ingredient2_falling <= 16'h0010;
			end
			16'h2010: 
			begin
				ingredient1_ycoord <= burger1_PtopY;
				ingredient1_xcoord <= burger1_PtopX;
        ingredient2_ycoord <= burger3_BBtopY;
        ingredient2_xcoord <= burger3_BBtopX;
				ingredient1_falling <= 16'h2000;
        ingredient2_falling <= 16'h0010;
			end
			16'h1010: 
			begin
				ingredient1_ycoord <= burger1_BBtopY;
				ingredient1_xcoord <= burger1_BBtopX;
        ingredient2_ycoord <= burger3_BBtopY;
        ingredient2_xcoord <= burger3_BBtopX;
				ingredient1_falling <= 16'h1000;
        ingredient2_falling <= 16'h0010;
			end

      16'h8008: 
			begin
				ingredient1_ycoord <= burger1_topY;
				ingredient1_xcoord <= burger1_topX;
        ingredient2_ycoord <= burger4_topY;
        ingredient2_xcoord <= burger4_topX;
				ingredient1_falling <= 16'h8000;
        ingredient2_falling <= 16'h0008;
			end
			16'h4008: 
			begin
				ingredient1_ycoord <= burger1_LtopY;
				ingredient1_xcoord <= burger1_LtopX;
        ingredient2_ycoord <= burger4_topY;
        ingredient2_xcoord <= burger4_topX;
				ingredient1_falling <= 16'h4000;
        ingredient2_falling <= 16'h0008;
			end
			16'h2008: 
			begin
				ingredient1_ycoord <= burger1_PtopY;
				ingredient1_xcoord <= burger1_PtopX;
        ingredient2_ycoord <= burger4_topY;
        ingredient2_xcoord <= burger4_topX;
				ingredient1_falling <= 16'h2000;
        ingredient2_falling <= 16'h0008;
			end
			16'h1008: 
			begin
				ingredient1_ycoord <= burger1_BBtopY;
				ingredient1_xcoord <= burger1_BBtopX;
        ingredient2_ycoord <= burger4_topY;
        ingredient2_xcoord <= burger4_topX;
				ingredient1_falling <= 16'h1000;
        ingredient2_falling <= 16'h0008;
			end

      16'h8004: 
			begin
				ingredient1_ycoord <= burger1_topY;
				ingredient1_xcoord <= burger1_topX;
        ingredient2_ycoord <= burger4_LtopY;
        ingredient2_xcoord <= burger4_LtopX;
				ingredient1_falling <= 16'h8000;
        ingredient2_falling <= 16'h0004;
			end
			16'h4004: 
			begin
				ingredient1_ycoord <= burger1_LtopY;
				ingredient1_xcoord <= burger1_LtopX;
        ingredient2_ycoord <= burger4_LtopY;
        ingredient2_xcoord <= burger4_LtopX;
				ingredient1_falling <= 16'h4000;
        ingredient2_falling <= 16'h0004;
			end
			16'h2004: 
			begin
				ingredient1_ycoord <= burger1_PtopY;
				ingredient1_xcoord <= burger1_PtopX;
        ingredient2_ycoord <= burger4_LtopY;
        ingredient2_xcoord <= burger4_LtopX;
				ingredient1_falling <= 16'h2000;
        ingredient2_falling <= 16'h0004;
			end
			16'h1004: 
			begin
				ingredient1_ycoord <= burger1_BBtopY;
				ingredient1_xcoord <= burger1_BBtopX;
        ingredient2_ycoord <= burger4_LtopY;
        ingredient2_xcoord <= burger4_LtopX;
				ingredient1_falling <= 16'h1000;
        ingredient2_falling <= 16'h0004;
			end

      16'h8002: 
			begin
				ingredient1_ycoord <= burger1_topY;
				ingredient1_xcoord <= burger1_topX;
        ingredient2_ycoord <= burger4_PtopY;
        ingredient2_xcoord <= burger4_PtopX;
				ingredient1_falling <= 16'h8000;
        ingredient2_falling <= 16'h0002;
			end
			16'h4002: 
			begin
				ingredient1_ycoord <= burger1_LtopY;
				ingredient1_xcoord <= burger1_LtopX;
        ingredient2_ycoord <= burger4_PtopY;
        ingredient2_xcoord <= burger4_PtopX;
				ingredient1_falling <= 16'h4000;
        ingredient2_falling <= 16'h0002;
			end
			16'h2002: 
			begin
				ingredient1_ycoord <= burger1_PtopY;
				ingredient1_xcoord <= burger1_PtopX;
        ingredient2_ycoord <= burger4_PtopY;
        ingredient2_xcoord <= burger4_PtopX;
				ingredient1_falling <= 16'h2000;
        ingredient2_falling <= 16'h0002;
			end
			16'h1002: 
			begin
				ingredient1_ycoord <= burger1_BBtopY;
				ingredient1_xcoord <= burger1_BBtopX;
        ingredient2_ycoord <= burger4_PtopY;
        ingredient2_xcoord <= burger4_PtopX;
				ingredient1_falling <= 16'h1000;
        ingredient2_falling <= 16'h0002;
			end

      16'h8001: 
			begin
				ingredient1_ycoord <= burger1_topY;
				ingredient1_xcoord <= burger1_topX;
        ingredient2_ycoord <= burger4_BBtopY;
        ingredient2_xcoord <= burger4_BBtopX;
				ingredient1_falling <= 16'h8000;
        ingredient2_falling <= 16'h0001;
			end
			16'h4001: 
			begin
				ingredient1_ycoord <= burger1_LtopY;
				ingredient1_xcoord <= burger1_LtopX;
        ingredient2_ycoord <= burger4_BBtopY;
        ingredient2_xcoord <= burger4_BBtopX;
				ingredient1_falling <= 16'h4000;
        ingredient2_falling <= 16'h0001;
			end
			16'h2001: 
			begin
				ingredient1_ycoord <= burger1_PtopY;
				ingredient1_xcoord <= burger1_PtopX;
        ingredient2_ycoord <= burger4_BBtopY;
        ingredient2_xcoord <= burger4_BBtopX;
				ingredient1_falling <= 16'h2000;
        ingredient2_falling <= 16'h0001;
			end
			16'h1001: 
			begin
				ingredient1_ycoord <= burger1_BBtopY;
				ingredient1_xcoord <= burger1_BBtopX;
        ingredient2_ycoord <= burger4_BBtopY;
        ingredient2_xcoord <= burger4_BBtopX;
				ingredient1_falling <= 16'h1000;
        ingredient2_falling <= 16'h0001;
			end

			16'h0880: 
			begin
				ingredient1_ycoord <= burger2_topY;
				ingredient1_xcoord <= burger2_topX;
        ingredient2_ycoord <= burger3_topY;
        ingredient2_xcoord <= burger3_topX;
				ingredient1_falling <= 16'h0800;
        ingredient2_falling <= 16'h0080;
			end
			16'h0480: 
			begin
				ingredient1_ycoord <= burger2_LtopY;
				ingredient1_xcoord <= burger2_LtopX;
        ingredient2_ycoord <= burger3_topY;
        ingredient2_xcoord <= burger3_topX;
				ingredient1_falling <= 16'h0400;
        ingredient2_falling <= 16'h0080;
			end
			16'h0280: 
			begin
				ingredient1_ycoord <= burger2_PtopY;
				ingredient1_xcoord <= burger2_PtopX;
        ingredient2_ycoord <= burger3_topY;
        ingredient2_xcoord <= burger3_topX;
				ingredient1_falling <= 16'h0200;
        ingredient2_falling <= 16'h0080;
			end
			16'h0180: 
			begin
				ingredient1_ycoord <= burger2_BBtopY;
				ingredient1_xcoord <= burger2_BBtopX;
        ingredient2_ycoord <= burger3_topY;
        ingredient2_xcoord <= burger3_topX;
				ingredient1_falling <= 16'h0100;
        ingredient2_falling <= 16'h0080;
			end

      16'h0840: 
			begin
				ingredient1_ycoord <= burger2_topY;
				ingredient1_xcoord <= burger2_topX;
        ingredient2_ycoord <= burger3_LtopY;
        ingredient2_xcoord <= burger3_LtopX;
				ingredient1_falling <= 16'h0800;
        ingredient2_falling <= 16'h0040;
			end
			16'h0440: 
			begin
				ingredient1_ycoord <= burger2_LtopY;
				ingredient1_xcoord <= burger2_LtopX;
        ingredient2_ycoord <= burger3_LtopY;
        ingredient2_xcoord <= burger3_LtopX;
				ingredient1_falling <= 16'h0400;
        ingredient2_falling <= 16'h0040;
			end
			16'h0240: 
			begin
				ingredient1_ycoord <= burger2_PtopY;
				ingredient1_xcoord <= burger2_PtopX;
        ingredient2_ycoord <= burger3_LtopY;
        ingredient2_xcoord <= burger3_LtopX;
				ingredient1_falling <= 16'h0200;
        ingredient2_falling <= 16'h0040;
			end
			16'h0140: 
			begin
				ingredient1_ycoord <= burger2_BBtopY;
				ingredient1_xcoord <= burger2_BBtopX;
        ingredient2_ycoord <= burger3_LtopY;
        ingredient2_xcoord <= burger3_LtopX;
				ingredient1_falling <= 16'h0100;
        ingredient2_falling <= 16'h0040;
			end

      16'h0820: 
			begin
				ingredient1_ycoord <= burger2_topY;
				ingredient1_xcoord <= burger2_topX;
        ingredient2_ycoord <= burger3_PtopY;
        ingredient2_xcoord <= burger3_PtopX;
				ingredient1_falling <= 16'h0800;
        ingredient2_falling <= 16'h0020;
			end
			16'h0420: 
			begin
				ingredient1_ycoord <= burger2_LtopY;
				ingredient1_xcoord <= burger2_LtopX;
        ingredient2_ycoord <= burger3_PtopY;
        ingredient2_xcoord <= burger3_PtopX;
				ingredient1_falling <= 16'h0400;
        ingredient2_falling <= 16'h0020;
			end
			16'h0220: 
			begin
				ingredient1_ycoord <= burger2_PtopY;
				ingredient1_xcoord <= burger2_PtopX;
        ingredient2_ycoord <= burger3_PtopY;
        ingredient2_xcoord <= burger3_PtopX;
				ingredient1_falling <= 16'h0200;
        ingredient2_falling <= 16'h0020;
			end
			16'h0120: 
			begin
				ingredient1_ycoord <= burger2_BBtopY;
				ingredient1_xcoord <= burger2_BBtopX;
        ingredient2_ycoord <= burger3_PtopY;
        ingredient2_xcoord <= burger3_PtopX;
				ingredient1_falling <= 16'h0100;
        ingredient2_falling <= 16'h0020;
			end

      16'h0810: 
			begin
				ingredient1_ycoord <= burger2_topY;
				ingredient1_xcoord <= burger2_topX;
        ingredient2_ycoord <= burger3_BBtopY;
        ingredient2_xcoord <= burger3_BBtopX;
				ingredient1_falling <= 16'h0800;
        ingredient2_falling <= 16'h0010;
			end
			16'h0410: 
			begin
				ingredient1_ycoord <= burger2_LtopY;
				ingredient1_xcoord <= burger2_LtopX;
        ingredient2_ycoord <= burger3_BBtopY;
        ingredient2_xcoord <= burger3_BBtopX;
				ingredient1_falling <= 16'h0400;
        ingredient2_falling <= 16'h0010;
			end
			16'h0210: 
			begin
				ingredient1_ycoord <= burger2_PtopY;
				ingredient1_xcoord <= burger2_PtopX;
        ingredient2_ycoord <= burger3_BBtopY;
        ingredient2_xcoord <= burger3_BBtopX;
				ingredient1_falling <= 16'h0200;
        ingredient2_falling <= 16'h0010;
			end
			16'h0110: 
			begin
				ingredient1_ycoord <= burger2_BBtopY;
				ingredient1_xcoord <= burger2_BBtopX;
        ingredient2_ycoord <= burger3_BBtopY;
        ingredient2_xcoord <= burger3_BBtopX;
				ingredient1_falling <= 16'h0100;
        ingredient2_falling <= 16'h0010;
			end

      16'h0808: 
			begin
				ingredient1_ycoord <= burger2_topY;
				ingredient1_xcoord <= burger2_topX;
        ingredient2_ycoord <= burger4_topY;
        ingredient2_xcoord <= burger4_topX;
				ingredient1_falling <= 16'h0800;
        ingredient2_falling <= 16'h0008;
			end
			16'h0408: 
			begin
				ingredient1_ycoord <= burger2_LtopY;
				ingredient1_xcoord <= burger2_LtopX;
        ingredient2_ycoord <= burger4_topY;
        ingredient2_xcoord <= burger4_topX;
				ingredient1_falling <= 16'h0400;
        ingredient2_falling <= 16'h0008;
			end
			16'h0208: 
			begin
				ingredient1_ycoord <= burger2_PtopY;
				ingredient1_xcoord <= burger2_PtopX;
        ingredient2_ycoord <= burger4_topY;
        ingredient2_xcoord <= burger4_topX;
				ingredient1_falling <= 16'h0200;
        ingredient2_falling <= 16'h0008;
			end
			16'h0108: 
			begin
				ingredient1_ycoord <= burger2_BBtopY;
				ingredient1_xcoord <= burger2_BBtopX;
        ingredient2_ycoord <= burger4_topY;
        ingredient2_xcoord <= burger4_topX;
				ingredient1_falling <= 16'h0100;
        ingredient2_falling <= 16'h0008;
			end

      16'h0804: 
			begin
				ingredient1_ycoord <= burger2_topY;
				ingredient1_xcoord <= burger2_topX;
        ingredient2_ycoord <= burger4_LtopY;
        ingredient2_xcoord <= burger4_LtopX;
				ingredient1_falling <= 16'h0800;
        ingredient2_falling <= 16'h0004;
			end
			16'h0404: 
			begin
				ingredient1_ycoord <= burger2_LtopY;
				ingredient1_xcoord <= burger2_LtopX;
        ingredient2_ycoord <= burger4_LtopY;
        ingredient2_xcoord <= burger4_LtopX;
				ingredient1_falling <= 16'h0400;
        ingredient2_falling <= 16'h0004;
			end
			16'h0204: 
			begin
				ingredient1_ycoord <= burger2_PtopY;
				ingredient1_xcoord <= burger2_PtopX;
        ingredient2_ycoord <= burger4_LtopY;
        ingredient2_xcoord <= burger4_LtopX;
				ingredient1_falling <= 16'h0200;
        ingredient2_falling <= 16'h0004;
			end
			16'h0104: 
			begin
				ingredient1_ycoord <= burger2_BBtopY;
				ingredient1_xcoord <= burger2_BBtopX;
        ingredient2_ycoord <= burger4_LtopY;
        ingredient2_xcoord <= burger4_LtopX;
				ingredient1_falling <= 16'h0100;
        ingredient2_falling <= 16'h0004;
			end

      16'h0802: 
			begin
				ingredient1_ycoord <= burger2_topY;
				ingredient1_xcoord <= burger2_topX;
        ingredient2_ycoord <= burger4_PtopY;
        ingredient2_xcoord <= burger4_PtopX;
				ingredient1_falling <= 16'h0800;
        ingredient2_falling <= 16'h0002;
			end
			16'h0402: 
			begin
				ingredient1_ycoord <= burger2_LtopY;
				ingredient1_xcoord <= burger2_LtopX;
        ingredient2_ycoord <= burger4_PtopY;
        ingredient2_xcoord <= burger4_PtopX;
				ingredient1_falling <= 16'h0400;
        ingredient2_falling <= 16'h0002;
			end
			16'h0202: 
			begin
				ingredient1_ycoord <= burger2_PtopY;
				ingredient1_xcoord <= burger2_PtopX;
        ingredient2_ycoord <= burger4_PtopY;
        ingredient2_xcoord <= burger4_PtopX;
				ingredient1_falling <= 16'h0200;
        ingredient2_falling <= 16'h0002;
			end
			16'h0102: 
			begin
				ingredient1_ycoord <= burger2_BBtopY;
				ingredient1_xcoord <= burger2_BBtopX;
        ingredient2_ycoord <= burger4_PtopY;
        ingredient2_xcoord <= burger4_PtopX;
				ingredient1_falling <= 16'h0100;
        ingredient2_falling <= 16'h0002;
			end

      16'h0801: 
			begin
				ingredient1_ycoord <= burger2_topY;
				ingredient1_xcoord <= burger2_topX;
        ingredient2_ycoord <= burger4_BBtopY;
        ingredient2_xcoord <= burger4_BBtopX;
				ingredient1_falling <= 16'h0800;
        ingredient2_falling <= 16'h0001;
			end
			16'h0401: 
			begin
				ingredient1_ycoord <= burger2_LtopY;
				ingredient1_xcoord <= burger2_LtopX;
        ingredient2_ycoord <= burger4_BBtopY;
        ingredient2_xcoord <= burger4_BBtopX;
				ingredient1_falling <= 16'h0400;
        ingredient2_falling <= 16'h0001;
			end
			16'h0201: 
			begin
				ingredient1_ycoord <= burger2_PtopY;
				ingredient1_xcoord <= burger2_PtopX;
        ingredient2_ycoord <= burger4_BBtopY;
        ingredient2_xcoord <= burger4_BBtopX;
				ingredient1_falling <= 16'h0200;
        ingredient2_falling <= 16'h0001;
			end
			16'h0101: 
			begin
				ingredient1_ycoord <= burger2_BBtopY;
				ingredient1_xcoord <= burger2_BBtopX;
        ingredient2_ycoord <= burger4_BBtopY;
        ingredient2_xcoord <= burger4_BBtopX;
				ingredient1_falling <= 16'h0100;
        ingredient2_falling <= 16'h0001;
			end

      16'h0081: 
			begin
				ingredient1_ycoord <= burger3_topY;
				ingredient1_xcoord <= burger3_topX;
        ingredient2_ycoord <= burger4_BBtopY;
        ingredient2_xcoord <= burger4_BBtopX;
				ingredient1_falling <= 16'h0080;
        ingredient2_falling <= 16'h0001;
			end
			16'h0041: 
			begin
				ingredient1_ycoord <= burger3_LtopY;
				ingredient1_xcoord <= burger3_LtopX;
        ingredient2_ycoord <= burger4_BBtopY;
        ingredient2_xcoord <= burger4_BBtopX;
				ingredient1_falling <= 16'h0040;
        ingredient2_falling <= 16'h0001;
			end
			16'h0021: 
			begin
				ingredient1_ycoord <= burger3_PtopY;
				ingredient1_xcoord <= burger3_PtopX;
        ingredient2_ycoord <= burger4_BBtopY;
        ingredient2_xcoord <= burger4_BBtopX;
				ingredient1_falling <= 16'h0020;
        ingredient2_falling <= 16'h0001;
			end
			16'h0011: 
			begin
				ingredient1_ycoord <= burger3_BBtopY;
				ingredient1_xcoord <= burger3_BBtopX;
        ingredient2_ycoord <= burger4_BBtopY;
        ingredient2_xcoord <= burger4_BBtopX;
				ingredient1_falling <= 16'h0010;
        ingredient2_falling <= 16'h0001;
			end

      16'h0082: 
			begin
				ingredient1_ycoord <= burger3_topY;
				ingredient1_xcoord <= burger3_topX;
        ingredient2_ycoord <= burger4_PtopY;
        ingredient2_xcoord <= burger4_PtopX;
				ingredient1_falling <= 16'h0080;
        ingredient2_falling <= 16'h0002;
			end
			16'h0042: 
			begin
				ingredient1_ycoord <= burger3_LtopY;
				ingredient1_xcoord <= burger3_LtopX;
        ingredient2_ycoord <= burger4_PtopY;
        ingredient2_xcoord <= burger4_PtopX;
				ingredient1_falling <= 16'h0040;
        ingredient2_falling <= 16'h0002;
			end
			16'h0022: 
			begin
				ingredient1_ycoord <= burger3_PtopY;
				ingredient1_xcoord <= burger3_PtopX;
        ingredient2_ycoord <= burger4_PtopY;
        ingredient2_xcoord <= burger4_PtopX;
				ingredient1_falling <= 16'h0020;
        ingredient2_falling <= 16'h0002;
			end
			16'h0012: 
			begin
				ingredient1_ycoord <= burger3_BBtopY;
				ingredient1_xcoord <= burger3_BBtopX;
        ingredient2_ycoord <= burger4_PtopY;
        ingredient2_xcoord <= burger4_PtopX;
				ingredient1_falling <= 16'h0010;
        ingredient2_falling <= 16'h0002;
			end

      16'h0084: 
			begin
				ingredient1_ycoord <= burger3_topY;
				ingredient1_xcoord <= burger3_topX;
        ingredient2_ycoord <= burger4_LtopY;
        ingredient2_xcoord <= burger4_LtopX;
				ingredient1_falling <= 16'h0080;
        ingredient2_falling <= 16'h0004;
			end
			16'h0044: 
			begin
				ingredient1_ycoord <= burger3_LtopY;
				ingredient1_xcoord <= burger3_LtopX;
        ingredient2_ycoord <= burger4_LtopY;
        ingredient2_xcoord <= burger4_LtopX;
				ingredient1_falling <= 16'h0040;
        ingredient2_falling <= 16'h0004;
			end
			16'h0024: 
			begin
				ingredient1_ycoord <= burger3_PtopY;
				ingredient1_xcoord <= burger3_PtopX;
        ingredient2_ycoord <= burger4_LtopY;
        ingredient2_xcoord <= burger4_LtopX;
				ingredient1_falling <= 16'h0020;
        ingredient2_falling <= 16'h0004;
			end
			16'h0014: 
			begin
				ingredient1_ycoord <= burger3_BBtopY;
				ingredient1_xcoord <= burger3_BBtopX;
        ingredient2_ycoord <= burger4_LtopY;
        ingredient2_xcoord <= burger4_LtopX;
				ingredient1_falling <= 16'h0010;
        ingredient2_falling <= 16'h0004;
			end

      16'h0088: 
			begin
				ingredient1_ycoord <= burger3_topY;
				ingredient1_xcoord <= burger3_topX;
        ingredient2_ycoord <= burger4_topY;
        ingredient2_xcoord <= burger4_topX;
				ingredient1_falling <= 16'h0080;
        ingredient2_falling <= 16'h0008;
			end
			16'h0048: 
			begin
				ingredient1_ycoord <= burger3_LtopY;
				ingredient1_xcoord <= burger3_LtopX;
        ingredient2_ycoord <= burger4_topY;
        ingredient2_xcoord <= burger4_topX;
				ingredient1_falling <= 16'h0040;
        ingredient2_falling <= 16'h0008;
			end
			16'h0028: 
			begin
				ingredient1_ycoord <= burger3_PtopY;
				ingredient1_xcoord <= burger3_PtopX;
        ingredient2_ycoord <= burger4_topY;
        ingredient2_xcoord <= burger4_topX;
				ingredient1_falling <= 16'h0020;
        ingredient2_falling <= 16'h0008;
			end
			16'h0018: 
			begin
				ingredient1_ycoord <= burger3_BBtopY;
				ingredient1_xcoord <= burger3_BBtopX;
        ingredient2_ycoord <= burger4_topY;
        ingredient2_xcoord <= burger4_topX;
				ingredient1_falling <= 16'h0010;
        ingredient2_falling <= 16'h0008;
			end

			16'hC000: 
			begin
				ingredient1_ycoord <= burger1_topY;
				ingredient1_xcoord <= burger1_topX;
        ingredient2_ycoord <= burger1_LtopY;
        ingredient2_xcoord <= burger1_LtopX;
				ingredient1_falling <= 16'h8000;
        ingredient2_falling <= 16'h4000;
			end
			16'hA000: 
			begin
				ingredient1_ycoord <= burger1_topY;
				ingredient1_xcoord <= burger1_topX;
        ingredient2_ycoord <= burger1_PtopY;
        ingredient2_xcoord <= burger1_PtopX;
				ingredient1_falling <= 16'h8000;
        ingredient2_falling <= 16'h2000;
			end
			16'h9000: 
			begin
				ingredient1_ycoord <= burger1_topY;
				ingredient1_xcoord <= burger1_topX;
        ingredient2_ycoord <= burger1_BBtopY;
        ingredient2_xcoord <= burger1_BBtopX;
				ingredient1_falling <= 16'h8000;
        ingredient2_falling <= 16'h1000;
			end
			16'h6000: 
			begin
				ingredient1_ycoord <= burger1_LtopY;
				ingredient1_xcoord <= burger1_LtopX;
        ingredient2_ycoord <= burger1_PtopY;
        ingredient2_xcoord <= burger1_PtopX;
				ingredient1_falling <= 16'h4000;
        ingredient2_falling <= 16'h2000;
			end
			16'h5000: 
			begin
				ingredient1_ycoord <= burger1_LtopY;
				ingredient1_xcoord <= burger1_LtopX;
        ingredient2_ycoord <= burger1_BBtopY;
        ingredient2_xcoord <= burger1_BBtopX;
				ingredient1_falling <= 16'h4000;
        ingredient2_falling <= 16'h1000;
			end
			16'h3000: 
			begin
				ingredient1_ycoord <= burger1_PtopY;
				ingredient1_xcoord <= burger1_PtopX;
        ingredient2_ycoord <= burger1_BBtopY;
        ingredient2_xcoord <= burger1_BBtopX;
				ingredient1_falling <= 16'h2000;
        ingredient2_falling <= 16'h1000;
			end

			16'h0C00: 
			begin
				ingredient1_ycoord <= burger2_topY;
				ingredient1_xcoord <= burger2_topX;
        ingredient2_ycoord <= burger2_LtopY;
        ingredient2_xcoord <= burger2_LtopX;
				ingredient1_falling <= 16'h0800;
        ingredient2_falling <= 16'h0400;
			end
			16'h0A00: 
			begin
				ingredient1_ycoord <= burger2_topY;
				ingredient1_xcoord <= burger2_topX;
        ingredient2_ycoord <= burger2_PtopY;
        ingredient2_xcoord <= burger2_PtopX;
				ingredient1_falling <= 16'h0800;
        ingredient2_falling <= 16'h0200;
			end
			16'h0900: 
			begin
				ingredient1_ycoord <= burger2_topY;
				ingredient1_xcoord <= burger2_topX;
        ingredient2_ycoord <= burger2_BBtopY;
        ingredient2_xcoord <= burger2_BBtopX;
				ingredient1_falling <= 16'h0800;
        ingredient2_falling <= 16'h0100;
			end
			16'h0600: 
			begin
				ingredient1_ycoord <= burger2_LtopY;
				ingredient1_xcoord <= burger2_LtopX;
        ingredient2_ycoord <= burger2_PtopY;
        ingredient2_xcoord <= burger2_PtopX;
				ingredient1_falling <= 16'h0400;
        ingredient2_falling <= 16'h0200;
			end
			16'h0500: 
			begin
				ingredient1_ycoord <= burger2_LtopY;
				ingredient1_xcoord <= burger2_LtopX;
        ingredient2_ycoord <= burger2_BBtopY;
        ingredient2_xcoord <= burger2_BBtopX;
				ingredient1_falling <= 16'h0400;
        ingredient2_falling <= 16'h0100;
			end
			16'h0300: 
			begin
				ingredient1_ycoord <= burger2_PtopY;
				ingredient1_xcoord <= burger2_PtopX;
        ingredient2_ycoord <= burger2_BBtopY;
        ingredient2_xcoord <= burger2_BBtopX;
				ingredient1_falling <= 16'h0200;
        ingredient2_falling <= 16'h0100;
			end

			16'h00C0: 
			begin
				ingredient1_ycoord <= burger3_topY;
				ingredient1_xcoord <= burger3_topX;
        ingredient2_ycoord <= burger3_LtopY;
        ingredient2_xcoord <= burger3_LtopX;
				ingredient1_falling <= 16'h0080;
        ingredient2_falling <= 16'h0040;
			end
			16'h00A0: 
			begin
				ingredient1_ycoord <= burger3_topY;
				ingredient1_xcoord <= burger3_topX;
        ingredient2_ycoord <= burger3_PtopY;
        ingredient2_xcoord <= burger3_PtopX;
				ingredient1_falling <= 16'h0080;
        ingredient2_falling <= 16'h0020;
			end
			16'h0090: 
			begin
				ingredient1_ycoord <= burger3_topY;
				ingredient1_xcoord <= burger3_topX;
        ingredient2_ycoord <= burger3_BBtopY;
        ingredient2_xcoord <= burger3_BBtopX;
				ingredient1_falling <= 16'h0080;
        ingredient2_falling <= 16'h0010;
			end
			16'h0060: 
			begin
				ingredient1_ycoord <= burger3_LtopY;
				ingredient1_xcoord <= burger3_LtopX;
        ingredient2_ycoord <= burger3_PtopY;
        ingredient2_xcoord <= burger3_PtopX;
				ingredient1_falling <= 16'h0040;
        ingredient2_falling <= 16'h0020;
			end
			16'h0050: 
			begin
				ingredient1_ycoord <= burger3_LtopY;
				ingredient1_xcoord <= burger3_LtopX;
        ingredient2_ycoord <= burger3_BBtopY;
        ingredient2_xcoord <= burger3_BBtopX;
				ingredient1_falling <= 16'h0040;
        ingredient2_falling <= 16'h0010;
			end
			16'h0030: 
			begin
				ingredient1_ycoord <= burger3_PtopY;
				ingredient1_xcoord <= burger3_PtopX;
        ingredient2_ycoord <= burger3_BBtopY;
        ingredient2_xcoord <= burger3_BBtopX;
				ingredient1_falling <= 16'h0020;
        ingredient2_falling <= 16'h0010;
			end

			16'h000C: 
			begin
				ingredient1_ycoord <= burger4_topY;
				ingredient1_xcoord <= burger4_topX;
        ingredient2_ycoord <= burger4_LtopY;
        ingredient2_xcoord <= burger4_LtopX;
				ingredient1_falling <= 16'h0008;
        ingredient2_falling <= 16'h0004;
			end
			16'h000A: 
			begin
				ingredient1_ycoord <= burger4_topY;
				ingredient1_xcoord <= burger4_topX;
        ingredient2_ycoord <= burger4_PtopY;
        ingredient2_xcoord <= burger4_PtopX;
				ingredient1_falling <= 16'h0008;
        ingredient2_falling <= 16'h0002;
			end
			16'h0009: 
			begin
				ingredient1_ycoord <= burger4_topY;
				ingredient1_xcoord <= burger4_topX;
        ingredient2_ycoord <= burger4_BBtopY;
        ingredient2_xcoord <= burger4_BBtopX;
				ingredient1_falling <= 16'h0008;
        ingredient2_falling <= 16'h0001;
			end
			16'h0006: 
			begin
				ingredient1_ycoord <= burger4_LtopY;
				ingredient1_xcoord <= burger4_LtopX;
        ingredient2_ycoord <= burger4_PtopY;
        ingredient2_xcoord <= burger4_PtopX;
				ingredient1_falling <= 16'h0004;
        ingredient2_falling <= 16'h0002;
			end
			16'h0005: 
			begin
				ingredient1_ycoord <= burger4_LtopY;
				ingredient1_xcoord <= burger4_LtopX;
        ingredient2_ycoord <= burger4_BBtopY;
        ingredient2_xcoord <= burger4_BBtopX;
				ingredient1_falling <= 16'h0004;
        ingredient2_falling <= 16'h0001;
			end
			16'h0003: 
			begin
				ingredient1_ycoord <= burger4_PtopY;
				ingredient1_xcoord <= burger4_PtopX;
        ingredient2_ycoord <= burger4_BBtopY;
        ingredient2_xcoord <= burger4_BBtopX;
				ingredient1_falling <= 16'h0002;
        ingredient2_falling <= 16'h0001;
			end

      // default: 
			// begin
			// 	ingredient1_ycoord <= 10'd92;
			// 	ingredient1_xcoord <= 10'd32;
      //   ingredient2_ycoord <= 10'd92;
      //   ingredient2_xcoord <= 10'd32;
			// 	// ingredient1_falling <= '0;
      // end
		endcase
	end
endmodule