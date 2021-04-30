module  chef (
	 input Reset, frame_clk,
	 input [7:0] keycode,
    output [9:0] ChefX, ChefY
);
    
    logic [9:0] Chef_X_Pos, Chef_X_Motion, Chef_Y_Pos, Chef_Y_Motion, Chef_Size;
	 logic valid;
	 
    parameter [9:0] Chef_X_Center=96;   // Center position on the X axis
    parameter [9:0] Chef_Y_Center=141;  // Center position on the Y axis
    parameter [9:0] Chef_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Chef_X_Max=192;     // Rightmost point on the X axis
    parameter [9:0] Chef_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Chef_Y_Max=216;     // Bottommost point on the Y axis
	 parameter [9:0] Chef_X_Step=1;      // Step size on the X axis
    parameter [9:0] Chef_Y_Step=1;      // Step size on the Y axis

    assign Chef_Size = 1;
	 
	 stages_walls move_check (.Reset(Reset), .frame_clk(frame_clk), .Stage(3'b0), .keycode(keycode), .Chef_X_Pos(Chef_X_Pos), .Chef_Y_Pos(Chef_X_Pos), .valid(valid));
   
    always_ff @ (posedge Reset or posedge frame_clk)
    begin: Move_Chef
        if (Reset)  // Asynchronous Reset
        begin 
            Chef_Y_Motion <= 10'd0; 
				Chef_X_Motion <= 10'd0;
				Chef_Y_Pos <= Chef_Y_Center;
				Chef_X_Pos <= Chef_X_Center;
        end
           
        else if (valid)
        begin 
				 Chef_X_Motion <= 0;
				 Chef_Y_Motion <= 0;
					  
				 
				 case (keycode)
					8'h04 : begin
							  Chef_X_Motion <= -1; // A
							  Chef_Y_Motion <= 0;
							  end
					        
					8'h07 : begin
					        Chef_X_Motion <= 1; // D
							  Chef_Y_Motion <= 0;
							  end
							  
					8'h16 : begin
					        Chef_Y_Motion <= 1; // S
							  Chef_X_Motion <= 0;
							  end
							  
					8'h1A : begin
					        Chef_Y_Motion <= -1; // W
							  Chef_X_Motion <= 0;
							  end	  
							  
					default : begin
					          Chef_Y_Motion <= 0; // Anything else
							    Chef_X_Motion <= 0;
							    end
			   endcase
				 
				 Chef_Y_Pos <= (Chef_Y_Pos + Chef_Y_Motion);
				 Chef_X_Pos <= (Chef_X_Pos + Chef_X_Motion);
      
			
			end  
    end
       
    assign ChefX = Chef_X_Pos;
    assign ChefY = Chef_Y_Pos;
    

endmodule
