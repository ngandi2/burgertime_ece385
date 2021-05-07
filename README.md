# BurgerTime 
Hardware based implementation of the BurgerTime arcade game. 

## Instructions to Run the Game
1. Make a new Quartus project
2. Add the SystemVerilog files from the sv folder into the project, as well as the qip files and set final_top.sv as top level
3. Generate HDL in platform designer using the included qsys file
4. Use the generated sopcinfo file to create a new Eclipse project and add the usb_kb folder and main.c to the created project (these are located in ./software/final_drivers)
5. Generate BSP, build, and run the project in Eclipse after compiling in Quartus and programming the device

## Playing the Game
1. Follow prompts on screen when applicable
2. Control the chef with WASD (W and S only work on ladders, going left or right off of a ladder or platform makes the chef fall to platform immediately below him)
3. Press P to pepper (stun) enemies when they are close (next to the chef on either the left or right side)
4. Walk over the center of ingredients to make them fall
5. The game is over and a losing screen is shown when the chef loses all 3 lives (collides with enemies thrice)
6. If all 4 burgers are formed, a winning screen is shown
7. The score is displayed on the FPGA hex LEDs; the faster the stage is completed, the higher the score (a timer is incorporated into the score). Each ingredient that reached its destination adds 15 points/seconds while each enemy collision subtracts 60 seconds/points from the score. The score resets to 0 when the title screen is reached again (pressing ENTER after a game over/you win screen or pressing KEY0 on the FPGA). 