module spritesheet (
	 input Reset, frame_clk,
	 input pepper_icon, enemy_untouchable, enemy1_untouchable,
	 input [1:0] lives,
	 input [2:0] sprite_color_index, burgers,
    input [9:0] drawxsig, drawysig, chef_xcoord, chef_ycoord, enemy_xcoord, enemy_ycoord, enemy1_xcoord, enemy1_ycoord,
	 input [9:0] burger1_topX, burger1_topY, burger1_LtopX, burger1_LtopY, burger1_PtopX, burger1_PtopY, burger1_BBtopX, burger1_BBtopY, 
	 input [9:0] burger2_topX, burger2_topY, burger2_LtopX, burger2_LtopY, burger2_PtopX, burger2_PtopY, burger2_BBtopX, burger2_BBtopY, 
	 input [9:0] burger3_topX, burger3_topY, burger3_LtopX, burger3_LtopY, burger3_PtopX, burger3_PtopY, burger3_BBtopX, burger3_BBtopY, 
	 input [9:0] burger4_topX, burger4_topY, burger4_LtopX, burger4_LtopY, burger4_PtopX, burger4_PtopY, burger4_BBtopX, burger4_BBtopY, 
    output [9:0] xcoord, ycoord, spritesheet_x, spritesheet_y, spritesheet_xoffset, spritesheet_yoffset,
	 output chef, sausage, egg
);
    
   /*always_comb
	begin
		xcoord = (drawxsig >> 1) - 56;
		ycoord = (drawysig - 25) >> 1;
		if (xcoord < 0 || xcoord >= 208 || ycoord < 0 || ycoord >= 215)
		begin
			xcoord = 0;
			ycoord = 0;
		end
		if (xcoord >= chef_xcoord && xcoord < chef_xcoord + 16 && ycoord >= chef_ycoord && ycoord < chef_ycoord + 16)
		begin
			spritesheet_x = 10'd16;
         spritesheet_y = 10'd0;
			spritesheet_xoffset = xcoord - chef_xcoord;
			spritesheet_yoffset = ycoord - chef_ycoord;
			chef = 1'b1;
			burger1_top = 1'b0;
		end
		else if (xcoord >= burger1_topX && xcoord < burger1_topX + 32 && ycoord >= burger1_topY && ycoord < burger1_topY + 8)
		begin
			spritesheet_x = 10'd112;
         spritesheet_y = 10'd49;
			spritesheet_xoffset = xcoord - burger1_topX;
			spritesheet_yoffset = ycoord - burger1_topY;
			chef = 1'b0;
			burger1_top = 1'b1;
		end
		else
		begin
			spritesheet_x = 10'd0;
         spritesheet_y = 10'd0;
			spritesheet_xoffset = 0;
			spritesheet_yoffset = 0;
			chef = 1'b0;
			burger1_top = 1'b0;
		end
	end*/
	integer i;
	logic clkdiv;
	logic [3:0] counter;
	
   always_ff @ (posedge frame_clk or posedge Reset )
   begin 
       if (Reset) 
		 begin
           clkdiv <= 1'b0;
			  counter <= 4'b0000;
		 end
		 
       else 
		 begin
			  if (&counter)
			  begin
					clkdiv <= ~ (clkdiv);
					counter <= 4'b0000;
			  end
			  
			  else
					counter <= counter + 1;
		 end
   end
	
	/*always_ff @ (posedge clkdiv or posedge Reset )
   begin 
       if (Reset) 
           clkdiv2 <= 1'b0;
       else 
           clkdiv2 <= ~ (clkdiv2);
   end*/
	 
	always_comb
	begin
		xcoord = (drawxsig >> 1) - 56;
		ycoord = (drawysig - 25) >> 1;
		if (xcoord < 0 || xcoord >= 208 || ycoord < 0 || ycoord >= 215)
		begin
			xcoord = 0;
			ycoord = 0;
		end
		
		spritesheet_x = 10'd0;
		spritesheet_y = 10'd0;
		spritesheet_xoffset = 0;
		spritesheet_yoffset = 0;
		chef = 1'b0;
		sausage = 1'b0;
		egg = 1'b0;
		
		/*for (i = 0; i < lives; i++)
		begin
			if (xcoord >= 2 + (8 * i) && xcoord < 2 + (8 * i) + 8 && ycoord >= 207 && ycoord < 207 + 8)
			begin
				spritesheet_x = 10'd200;
				spritesheet_y = 10'd0;
				spritesheet_xoffset = xcoord - (2 + (8 * i));
				spritesheet_yoffset = ycoord - 207;
			end
		end
		
		for (i = 0; i < burgers; i++)
		begin
			if (xcoord >= 176 + (8 * i) && xcoord < 176 + (8 * i) + 8 && ycoord >= 207 && ycoord < 207 + 8)
			begin
				spritesheet_x = 10'd208;
				spritesheet_y = 10'd0;
				spritesheet_xoffset = xcoord - (176 + (8 * i));
				spritesheet_yoffset = ycoord - 207;
			end
		end*/
		
		for (i = 0; i < lives; i++)
		begin
			if (xcoord >= 2 && xcoord < 2 + 8 && ycoord >= 205 - (9 * i) && ycoord < 205 - (9 * i) + 9)
			begin
				spritesheet_x = 10'd200;
				spritesheet_y = 10'd0;
				spritesheet_xoffset = xcoord - 2;
				spritesheet_yoffset = ycoord - (205 - (9 * i));
			end
		end
		
		if (pepper_icon)
		begin
		if (xcoord >= 92 && xcoord < 92 + 24 && ycoord >= 209 && ycoord < 209 + 6)
		begin
			spritesheet_x = 10'd216;
			spritesheet_y = 10'd9;
			spritesheet_xoffset = xcoord - 92;
			spritesheet_yoffset = ycoord - 209;
		end
		end
		
		for (i = 0; i < burgers; i++)
		begin
			if (xcoord >= 198 && xcoord < 198 + 8 && ycoord >= 205- (8 * i) && ycoord < 205 - (8 * i) + 8)
			begin
				spritesheet_x = 10'd208;
				spritesheet_y = 10'd0;
				spritesheet_xoffset = xcoord - 198;
				spritesheet_yoffset = ycoord - (205 - (8 * i));
			end
		end
		
		if (xcoord >= chef_xcoord && xcoord < chef_xcoord + 16 && ycoord >= chef_ycoord && ycoord < chef_ycoord + 16)
		begin
			spritesheet_x = 10'd16;
         spritesheet_y = 10'd0;
			if (lives == 3'd0)
			begin
				spritesheet_x = 10'd112;
				spritesheet_y = 10'd16;
			end
			spritesheet_xoffset = xcoord - chef_xcoord;
			spritesheet_yoffset = ycoord - chef_ycoord;
			chef = 1'b1;
		end
		
		if (xcoord >= enemy_xcoord && xcoord < enemy_xcoord + 16 && ycoord >= enemy_ycoord && ycoord < enemy_ycoord + 16)
		begin			
			spritesheet_x = 10'd16;
         spritesheet_y = 10'd32;
			if (enemy_untouchable)
			begin
				spritesheet_x = 10'd80;
				if (clkdiv)
				begin
					spritesheet_x = 10'd64;
				end
				spritesheet_y = 10'd48;
			end
			spritesheet_xoffset = xcoord - enemy_xcoord;
			spritesheet_yoffset = ycoord - enemy_ycoord;
			sausage = 1'b1;
		end
		
		if (xcoord >= enemy1_xcoord && xcoord < enemy1_xcoord + 16 && ycoord >= enemy1_ycoord && ycoord < enemy1_ycoord + 16)
		begin
			spritesheet_x = 10'd16;
         spritesheet_y = 10'd96;
			if (enemy1_untouchable)
			begin
				spritesheet_x = 10'd80;
				if (clkdiv)
				begin
					spritesheet_x = 10'd64;
				end
				spritesheet_y = 10'd112;
			end
			spritesheet_xoffset = xcoord - enemy1_xcoord;
			spritesheet_yoffset = ycoord - enemy1_ycoord;
			egg = 1'b1;
		end

		if (((chef && sprite_color_index == 3'b000) || !chef) && ((sausage && sprite_color_index == 3'b000) || !sausage) && ((egg && sprite_color_index == 3'b000) || !egg))  
		begin
			if (xcoord >= burger1_topX && xcoord < burger1_topX + 32 && ycoord >= burger1_topY && ycoord < burger1_topY + 8)
			begin
				spritesheet_x = 10'd112;
				spritesheet_y = 10'd49;
				spritesheet_xoffset = xcoord - burger1_topX;
				spritesheet_yoffset = ycoord - burger1_topY;
			end
			else if (xcoord >= burger1_LtopX && xcoord < burger1_LtopX + 32 && ycoord >= burger1_LtopY && ycoord < burger1_LtopY + 8)
			begin
				spritesheet_x = 10'd112;
				spritesheet_y = 10'd89;
				spritesheet_xoffset = xcoord - burger1_LtopX;
				spritesheet_yoffset = ycoord - burger1_LtopY;
			end
			else if (xcoord >= burger1_PtopX && xcoord < burger1_PtopX + 32 && ycoord >= burger1_PtopY && ycoord < burger1_PtopY + 8)
			begin
				spritesheet_x = 10'd112;
				spritesheet_y = 10'd73;
				spritesheet_xoffset = xcoord - burger1_PtopX;
				spritesheet_yoffset = ycoord - burger1_PtopY;
			end
			else if (xcoord >= burger1_BBtopX && xcoord < burger1_BBtopX + 32 && ycoord >= burger1_BBtopY && ycoord < burger1_BBtopY + 8)
			begin
				spritesheet_x = 10'd112;
				spritesheet_y = 10'd57;
				spritesheet_xoffset = xcoord - burger1_BBtopX;
				spritesheet_yoffset = ycoord - burger1_BBtopY;
			end
			else if (xcoord >= burger2_topX && xcoord < burger2_topX + 32 && ycoord >= burger2_topY && ycoord < burger2_topY + 8)
			begin
				spritesheet_x = 10'd112;
				spritesheet_y = 10'd49;
				spritesheet_xoffset = xcoord - burger2_topX;
				spritesheet_yoffset = ycoord - burger2_topY;
			end
			else if (xcoord >= burger2_LtopX && xcoord < burger2_LtopX + 32 && ycoord >= burger2_LtopY && ycoord < burger2_LtopY + 8)
			begin
				spritesheet_x = 10'd112;
				spritesheet_y = 10'd89;
				spritesheet_xoffset = xcoord - burger2_LtopX;
				spritesheet_yoffset = ycoord - burger2_LtopY;
			end
			else if (xcoord >= burger2_PtopX && xcoord < burger2_PtopX + 32 && ycoord >= burger2_PtopY && ycoord < burger2_PtopY + 8)
			begin
				spritesheet_x = 10'd112;
				spritesheet_y = 10'd73;
				spritesheet_xoffset = xcoord - burger2_PtopX;
				spritesheet_yoffset = ycoord - burger2_PtopY;
			end
			else if (xcoord >= burger2_BBtopX && xcoord < burger2_BBtopX + 32 && ycoord >= burger2_BBtopY && ycoord < burger2_BBtopY + 8)
			begin
				spritesheet_x = 10'd112;
				spritesheet_y = 10'd57;
				spritesheet_xoffset = xcoord - burger2_BBtopX;
				spritesheet_yoffset = ycoord - burger2_BBtopY;
			end
			else if (xcoord >= burger3_topX && xcoord < burger3_topX + 32 && ycoord >= burger3_topY && ycoord < burger3_topY + 8)
			begin
				spritesheet_x = 10'd112;
				spritesheet_y = 10'd49;
				spritesheet_xoffset = xcoord - burger3_topX;
				spritesheet_yoffset = ycoord - burger3_topY;
			end
			else if (xcoord >= burger3_LtopX && xcoord < burger3_LtopX + 32 && ycoord >= burger3_LtopY && ycoord < burger3_LtopY + 8)
			begin
				spritesheet_x = 10'd112;
				spritesheet_y = 10'd89;
				spritesheet_xoffset = xcoord - burger3_LtopX;
				spritesheet_yoffset = ycoord - burger3_LtopY;
			end
			else if (xcoord >= burger3_PtopX && xcoord < burger3_PtopX + 32 && ycoord >= burger3_PtopY && ycoord < burger3_PtopY + 8)
			begin
				spritesheet_x = 10'd112;
				spritesheet_y = 10'd73;
				spritesheet_xoffset = xcoord - burger3_PtopX;
				spritesheet_yoffset = ycoord - burger3_PtopY;
			end
			else if (xcoord >= burger3_BBtopX && xcoord < burger3_BBtopX + 32 && ycoord >= burger3_BBtopY && ycoord < burger3_BBtopY + 8)
			begin
				spritesheet_x = 10'd112;
				spritesheet_y = 10'd57;
				spritesheet_xoffset = xcoord - burger3_BBtopX;
				spritesheet_yoffset = ycoord - burger3_BBtopY;
			end
			else if (xcoord >= burger4_topX && xcoord < burger4_topX + 32 && ycoord >= burger4_topY && ycoord < burger4_topY + 8)
			begin
				spritesheet_x = 10'd112;
				spritesheet_y = 10'd49;
				spritesheet_xoffset = xcoord - burger4_topX;
				spritesheet_yoffset = ycoord - burger4_topY;
			end
			else if (xcoord >= burger4_LtopX && xcoord < burger4_LtopX + 32 && ycoord >= burger4_LtopY && ycoord < burger4_LtopY + 8)
			begin
				spritesheet_x = 10'd112;
				spritesheet_y = 10'd89;
				spritesheet_xoffset = xcoord - burger4_LtopX;
				spritesheet_yoffset = ycoord - burger4_LtopY;
			end
			else if (xcoord >= burger4_PtopX && xcoord < burger4_PtopX + 32 && ycoord >= burger4_PtopY && ycoord < burger4_PtopY + 8)
			begin
				spritesheet_x = 10'd112;
				spritesheet_y = 10'd73;
				spritesheet_xoffset = xcoord - burger4_PtopX;
				spritesheet_yoffset = ycoord - burger4_PtopY;
			end
			else if (xcoord >= burger4_BBtopX && xcoord < burger4_BBtopX + 32 && ycoord >= burger4_BBtopY && ycoord < burger4_BBtopY + 8)
			begin
				spritesheet_x = 10'd112;
				spritesheet_y = 10'd57;
				spritesheet_xoffset = xcoord - burger4_BBtopX;
				spritesheet_yoffset = ycoord - burger4_BBtopY;
			end
		end
		
	end
	
endmodule
