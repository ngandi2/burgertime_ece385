module  stages_walls (
	 input Reset, frame_clk,
	 input [2:0] Stage,
	 input [7:0] keycode,
	 input [9:0] Chef_X_Pos, Chef_Y_Pos,
    output valid
);
	 logic move_Valid;
	 parameter [9:0] Chef_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Chef_X_Max=192;     // Rightmost point on the X axis
    parameter [9:0] Chef_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Chef_Y_Max=141;     // Bottommost point on the Y axis
    
	 //if (Stage == 3'b0)
	 //begin
	 always_ff @ (posedge Reset or posedge frame_clk)
	 begin
		  if (Reset)
		  begin
				move_Valid <= 1'b0;
		  end
		  
		  else
		  begin
		  move_Valid <= 1'b0;
	     case (keycode)
				8'h04 : begin // A
							  if (Chef_X_Pos >= Chef_X_Min && Chef_X_Pos <= Chef_X_Max)
									move_Valid <= 1'b1;
						  end
					        
			   8'h07 : begin // D
							  if (Chef_X_Pos >= Chef_X_Min && Chef_X_Pos <= Chef_X_Max)
									move_Valid <= 1'b1;
						  end
							  
				8'h16 : begin // S
							  if (Chef_Y_Pos >= Chef_Y_Min && Chef_Y_Pos <= Chef_Y_Max)
									move_Valid <= 1'b1;
						  end
							  
				8'h1A : begin // W
							  if (Chef_Y_Pos > Chef_Y_Min && Chef_Y_Pos <= Chef_Y_Max)
									move_Valid <= 1'b1;
						  end	  
							  
				default : move_Valid <= 1'b0;
			endcase
			end
	 //end
	 end
	 
	 assign valid = move_Valid;
    
endmodule
