module pepper (
		input logic Reset, frame_clk,
		input logic [7:0] keycode, 
		input logic [9:0] ChefX, ChefY, EnemyX, EnemyY, Enemy1X, Enemy1Y,
		output logic have_pepper, sausage_hit, egg_hit
);
	 logic sausage_pepper, egg_pepper, pepper_remaining;
	 logic [9:0] pepper_counter;
   
    always_ff @ (posedge Reset or posedge frame_clk)
    begin: Move_Chef
        if (Reset)  // Asynchronous Reset
        begin 
				sausage_pepper <= 1'b0;
				egg_pepper <= 1'b0;
				pepper_remaining <= 1'd1;
				pepper_counter <= 10'd0;
        end
		  
		  else
		  begin 
				if (keycode == 8'd19 && |pepper_remaining)
				begin
					pepper_remaining <= pepper_remaining - 1;
					if ((ChefX - 24 <= EnemyX) && (ChefX + 24 >= EnemyX) && (ChefY - 4 <= EnemyY) && (ChefY + 4 >= EnemyY)) 
						sausage_pepper <= 1'b1;
					if ((ChefX - 24 <= Enemy1X) && (ChefX + 24 >= Enemy1X) && (ChefY - 4 <= Enemy1Y) && (ChefY + 4 >= Enemy1Y)) 
						egg_pepper <= 1'b1;
				end
				
				if (sausage_pepper || egg_pepper)
				begin
					pepper_counter <= pepper_counter + 1;
				end 
		  
				if (pepper_counter >= 10'd600)
				begin
					pepper_counter <= 10'd0;
					sausage_pepper <= 1'b0;
					egg_pepper <= 1'b0;
				end
        end 
        
    end

	 assign have_pepper = pepper_remaining;
    assign sausage_hit = sausage_pepper;
    assign egg_hit = egg_pepper;

endmodule
