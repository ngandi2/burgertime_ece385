module spritesheet (
	 input enemy_hurt,
	 input [2:0] sprite_color_index,
    input [9:0] drawxsig, drawysig, chef_xcoord, chef_ycoord, enemy_xcoord, enemy_ycoord,
		input [9:0] burger1_topX, burger1_topY, burger1_LtopX, burger1_LtopY, burger1_PtopX, burger1_PtopY, burger1_BBtopX, burger1_BBtopY, 
		input [9:0] burger2_topX, burger2_topY, burger2_LtopX, burger2_LtopY, burger2_PtopX, burger2_PtopY, burger2_BBtopX, burger2_BBtopY, 
		input [9:0] burger3_topX, burger3_topY, burger3_LtopX, burger3_LtopY, burger3_PtopX, burger3_PtopY, burger3_BBtopX, burger3_BBtopY, 
		input [9:0] burger4_topX, burger4_topY, burger4_LtopX, burger4_LtopY, burger4_PtopX, burger4_PtopY, burger4_BBtopX, burger4_BBtopY, 
    output [9:0] xcoord, ycoord, spritesheet_x, spritesheet_y, spritesheet_xoffset, spritesheet_yoffset,
	 output chef,
	 output sausage
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
		
		if (xcoord >= chef_xcoord && xcoord < chef_xcoord + 16 && ycoord >= chef_ycoord && ycoord < chef_ycoord + 16)
		begin
			spritesheet_x = 10'd16;
         spritesheet_y = 10'd0;
			if (enemy_hurt)
			begin
			spritesheet_x = 10'd64;
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
			spritesheet_xoffset = xcoord - enemy_xcoord;
			spritesheet_yoffset = ycoord - enemy_ycoord;
			sausage = 1'b1;
		end

		if (((chef && sprite_color_index == 3'b000) || !chef) && ((sausage && sprite_color_index == 3'b000) || !sausage))  
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
