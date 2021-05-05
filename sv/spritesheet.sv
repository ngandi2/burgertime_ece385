module spritesheet (
	 input [2:0] sprite_color_index,
    input [9:0] drawxsig, drawysig, chef_xcoord, chef_ycoord, 
		input [9:0] burger1_topX, burger1_topY, burger1_LtopX, burger1_LtopY, burger1_PtopX, burger1_PtopY, burger1_BBtopX, burger1_BBtopY, 
    output [9:0] xcoord, ycoord, spritesheet_x, spritesheet_y, spritesheet_xoffset, spritesheet_yoffset,
	 output chef, burger1_top
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
		burger1_top = 1'b0;
		
		
		if (xcoord >= chef_xcoord && xcoord < chef_xcoord + 16 && ycoord >= chef_ycoord && ycoord < chef_ycoord + 16)
		begin
			spritesheet_x = 10'd16;
         spritesheet_y = 10'd0;
			spritesheet_xoffset = xcoord - chef_xcoord;
			spritesheet_yoffset = ycoord - chef_ycoord;
			chef = 1'b1;
		end

		if ((chef && sprite_color_index == 3'b000) || !chef)
		begin
			spritesheet_x = 10'd112;
			if (xcoord >= burger1_topX && xcoord < burger1_topX + 32 && ycoord >= burger1_topY && ycoord < burger1_topY + 8)
			begin
				spritesheet_y = 10'd49;
				spritesheet_xoffset = xcoord - burger1_topX;
				spritesheet_yoffset = ycoord - burger1_topY;
				burger1_top = 1'b1;
			end
			else if (xcoord >= burger1_LtopX && xcoord < burger1_LtopX + 32 && ycoord >= burger1_LtopY && ycoord < burger1_LtopY + 8)
			begin
				spritesheet_y = 10'd89;
				spritesheet_xoffset = xcoord - burger1_LtopX;
				spritesheet_yoffset = ycoord - burger1_LtopY;
				burger1_top = 1'b1;
			end
			else if (xcoord >= burger1_PtopX && xcoord < burger1_PtopX + 32 && ycoord >= burger1_PtopY && ycoord < burger1_PtopY + 8)
			begin
				spritesheet_y = 10'd73;
				spritesheet_xoffset = xcoord - burger1_PtopX;
				spritesheet_yoffset = ycoord - burger1_PtopY;
				burger1_top = 1'b1;
			end
			else if (xcoord >= burger1_BBtopX && xcoord < burger1_BBtopX + 32 && ycoord >= burger1_BBtopY && ycoord < burger1_BBtopY + 8)
			begin
				spritesheet_y = 10'd57;
				spritesheet_xoffset = xcoord - burger1_BBtopX;
				spritesheet_yoffset = ycoord - burger1_BBtopY;
				burger1_top = 1'b1;
			end
		end
		
	end
	
endmodule
