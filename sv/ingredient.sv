module ingredient (
    input Reset, frame_clk, walk, climb, 
    input [9:0] ChefX, ChefY, aboveIngredientX, aboveIngredientY,
	 output finish,
    output [9:0] BurgerX, BurgerY
);
	
	 logic reachedTarget;
    logic [9:0] Burger_X_Pos, Burger_X_Motion, Burger_Y_Pos, Burger_Y_Motion;
  
    parameter [9:0] Burger_X_Start = 0;    // Start position on the X axis
    parameter [9:0] Burger_Y_Start = 0;    // Start position on the Y axis
    parameter [9:0] Burger_X_Min = 0;      // Leftmost point on the X axis
    parameter [9:0] Burger_X_Max = 384;    // Rightmost point on the X axis
    parameter [9:0] Burger_Y_Min = 10;     // Topmost point on the Y axis
    parameter [9:0] Burger_Y_Max = 468;    // Bottommost point on the Y axis
    parameter [9:0] Burger_X_End = 384;    // End position on the X axis
    parameter [9:0] Burger_Y_End = 468;    // End position on the Y axis
   
    always_ff @ (posedge Reset or posedge frame_clk)
    begin: Move_Piece
        if (Reset)  // Asynchronous Reset
        begin 
            Burger_Y_Motion <= 10'd0; 
				Burger_X_Motion <= 10'd0;
				Burger_Y_Pos <= Burger_Y_Start;
				Burger_X_Pos <= Burger_X_Start;
				reachedTarget <= 1'd0;
		  end
           
        else if (!reachedTarget)
        begin 
				
				if (ChefX << 1 == Burger_X_Pos + 8 || aboveIngredientY == Burger_Y_Pos) 
				begin
					 Burger_Y_Pos <= Burger_Y_Pos + 10'd2;
				end
				 
				
				 
				if (!walk && !climb)
				begin
					 Burger_Y_Motion <= 1;
				end
				
				else
					 Burger_Y_Motion <= 0;
				
				if (Burger_Y_Pos == Burger_Y_End)
				begin
					 Burger_Y_Motion <= 0;
					 reachedTarget <= 1'd1;
				end
				 
				Burger_Y_Pos <= (Burger_Y_Pos + Burger_Y_Motion);
      
			
			end  
    end

    assign BurgerX = Burger_X_Pos >> 1;
    assign BurgerY = Burger_Y_Pos >> 1;
	 assign finish = reachedTarget;

endmodule
