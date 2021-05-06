module chef (
    input Reset, frame_clk, walk, climb, 
    input [7:0] keycode, 
    output [9:0] ChefX, ChefY
);
    
    logic [9:0] Chef_X_Pos, Chef_X_Motion, Chef_Y_Pos, Chef_Y_Motion, Chef_Size;
  
    parameter [9:0] Chef_X_Center = 192;   // Center position on the X axis
    parameter [9:0] Chef_Y_Center = 296;  // Center position on the Y axis
    parameter [9:0] Chef_X_Min = 0;       // Leftmost point on the X axis
    parameter [9:0] Chef_X_Max = 384;     // Rightmost point on the X axis
    parameter [9:0] Chef_Y_Min = 10;       // Topmost point on the Y axis
    parameter [9:0] Chef_Y_Max = 296;     // Bottommost point on the Y axis 468
    parameter [9:0] Chef_X_Step = 1;      // Step size on the X axis
    parameter [9:0] Chef_Y_Step = 1;      // Step size on the Y axis

    assign Chef_Size = 1;
   
    always_ff @ (posedge Reset or posedge frame_clk)
    begin: Move_Chef
        if (Reset)  // Asynchronous Reset
        begin 
            Chef_Y_Motion <= 10'd0; 
				Chef_X_Motion <= 10'd0;
				Chef_Y_Pos <= Chef_Y_Center;
				Chef_X_Pos <= Chef_X_Center;
        end
           
        else 
        begin 
				 case (keycode)
					8'h04 : begin
							  if (walk)
							  begin
									Chef_X_Motion <= -1; // A
									Chef_Y_Motion <= 0;
									if ( (Chef_X_Pos + Chef_X_Motion) <= Chef_X_Min )  // Chef is at the left edge
										Chef_X_Motion <= 0;
							  end
							  end
					        
					8'h07 : begin
							  if (walk)
							  begin
									Chef_X_Motion <= 1; // D
									Chef_Y_Motion <= 0;
									if ( (Chef_X_Pos + Chef_X_Motion) >= Chef_X_Max )  // Chef is at the right edge
										Chef_X_Motion <= 0; 
							  end
							  end
							  
					8'h16 : begin
							  if (climb)
							  begin
									Chef_Y_Motion <= 1; // S
									Chef_X_Motion <= 0;
									if ( (Chef_Y_Pos + Chef_Y_Motion) >= Chef_Y_Max )  // Chef is at the bottom edge
										Chef_Y_Motion <= 0; 
							  end
							  end
							  
					8'h1A : begin
							  if (climb)
							  begin
									Chef_Y_Motion <= -1; // W
									Chef_X_Motion <= 0;
									if ( (Chef_Y_Pos + Chef_Y_Motion) <= Chef_Y_Min )  // Chef is at the top edge
										Chef_Y_Motion <= 0;
							  end
							  end	  
							  
					default : begin
					          Chef_Y_Motion <= 0; // Anything else
							    Chef_X_Motion <= 0;
							    end
			   endcase
				
				 
				if (!climb && !walk)
				begin
					 Chef_Y_Motion <= 1;
					 Chef_X_Motion <= 0;
				end
				 
				Chef_Y_Pos <= (Chef_Y_Pos + Chef_Y_Motion);
				Chef_X_Pos <= (Chef_X_Pos + Chef_X_Motion);
      
			
			end  
    end

    assign ChefX = Chef_X_Pos >> 1;
    assign ChefY = Chef_Y_Pos >> 1;

endmodule
