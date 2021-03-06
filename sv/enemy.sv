module enemy (
		input logic Reset, frame_clk, walk, climb, pepper_stun,
		input logic [9:0] ChefX, ChefY,
		output logic enemy_hurt, enemy_untouchable,
		output logic [9:0] EnemyX, EnemyY
);
    
	 logic touched_chef, counter, cannot_kill;
    logic [9:0] Enemy_X_Pos, Enemy_X_Motion, Enemy_Y_Pos, Enemy_Y_Motion, Enemy_Size;
  
    parameter [9:0] Enemy_X_Center = 384;  // Center position on the X axis
    parameter [9:0] Enemy_Y_Center = 72;   // Center position on the Y axis
    parameter [9:0] Enemy_X_Min = 0;       // Leftmost point on the X axis
    parameter [9:0] Enemy_X_Max = 384;     // Rightmost point on the X axis
    parameter [9:0] Enemy_Y_Min = 10;      // Topmost point on the Y axis
    parameter [9:0] Enemy_Y_Max = 296;     // Bottommost point on the Y axis
    parameter [9:0] Enemy_X_Step = 1;      // Step size on the X axis
    parameter [9:0] Enemy_Y_Step = 1;      // Step size on the Y axis

    assign Enemy_Size = 1;
   
    always_ff @ (posedge Reset or posedge frame_clk)
    begin: Move_Enemy
        if (Reset)  // Asynchronous Reset
        begin 
            Enemy_Y_Motion <= 10'd0; 
				Enemy_X_Motion <= 10'd0;
				Enemy_Y_Pos <= Enemy_Y_Center;
				Enemy_X_Pos <= Enemy_X_Center;
				//touched_chef <= 1'b0;
				counter <= 1'b0;
				
        end
           
		  else if (touched_chef)
		  begin
				Enemy_Y_Motion <= 10'd0; 
				Enemy_X_Motion <= 10'd0;
				Enemy_Y_Pos <= Enemy_Y_Center;
				Enemy_X_Pos <= Enemy_X_Center;
				//touched_chef <= 1'b0;
				counter <= 1'b0;
				
		  end
		  
        else if (counter)
        begin 
				if (climb && (Enemy_Y_Pos >> 1) < ChefY)
				begin
					Enemy_Y_Motion <= Enemy_Y_Step; // S
					Enemy_X_Motion <= 0;
					if ( (Enemy_Y_Pos + Enemy_Y_Motion) >= Enemy_Y_Max )  // Enemy is at the bottom edge
						Enemy_Y_Motion <= 0; 
				end

				else if (climb && (Enemy_Y_Pos >> 1) > ChefY)
				begin
					Enemy_Y_Motion <= 0 - Enemy_Y_Step; // W
					Enemy_X_Motion <= 0;
					if ( (Enemy_Y_Pos + Enemy_Y_Motion) <= Enemy_Y_Min )  // Enemy is at the top edge
						Enemy_Y_Motion <= 0;
				end
				
				else if (walk && (Enemy_X_Pos >> 1) > ChefX)
				begin
					Enemy_X_Motion <= 0 - Enemy_X_Step; // A
					Enemy_Y_Motion <= 0;
					if ( (Enemy_X_Pos + Enemy_X_Motion) <= Enemy_X_Min )  // Enemy is at the left edge
						Enemy_X_Motion <= 0;
				end

				else if (walk && (Enemy_X_Pos >> 1) < ChefX)
				begin
					Enemy_X_Motion <= Enemy_X_Step; // D
					Enemy_Y_Motion <= 0;
					if ( (Enemy_X_Pos + Enemy_X_Motion) >= Enemy_X_Max )  // Enemy is at the right edge
						Enemy_X_Motion <= 0; 
				end

				else
				begin
					if (Enemy_X_Pos > (Enemy_X_Center >> 1))
						Enemy_X_Motion <= -1;
					else
						Enemy_X_Motion <= 1;
				end
				 
				if (~climb & ~walk)
				begin
					 Enemy_Y_Motion <= Enemy_Y_Step;
					 Enemy_X_Motion <= 0;
				end
				 
				if (~cannot_kill)
				begin
					 Enemy_Y_Pos <= (Enemy_Y_Pos + Enemy_Y_Motion);
					 Enemy_X_Pos <= (Enemy_X_Pos + Enemy_X_Motion);
				end
      
				counter <= 1'b0;
			
			end
	
			else 
				counter <= 1'b1;
    end
	 
	 always_comb
	 begin
		  if (pepper_stun)
		  begin
				cannot_kill = 1'b1;
		  end
		  
		  else
				cannot_kill = 1'b0;
			
		  if (((ChefX << 1 >= Enemy_X_Pos - 28) && (ChefX << 1 <= Enemy_X_Pos + 28)) && ((ChefY << 1 >= Enemy_Y_Pos - 28) && (ChefY << 1 <= Enemy_Y_Pos + 28)) && ~cannot_kill)
		  begin
				touched_chef = 1'b1;
		  end
		  
		  else
				touched_chef = 1'b0;
				
	 end

    assign EnemyX = Enemy_X_Pos >> 1;
    assign EnemyY = Enemy_Y_Pos >> 1;
	 assign enemy_hurt = touched_chef;
	 assign enemy_untouchable = cannot_kill;

endmodule
