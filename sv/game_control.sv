module game_control (
  input logic clock, reset, lives, burger_done, 
  input logic [7:0] keycode, 
  output logic game_start, game_win, game_lose, game_idle
);

  enum logic [1:0] {
    Start, 
    Play, 
    Win, 
    Lose
  } state, next_state;

  always_ff @ (posedge clock)
  begin
    if (reset)
    begin
      state <= Start;
    end
    else
    begin
      state <= next_state;
    end
  end

  always_comb 
  begin
    next_state = state;
    game_start = 1'b0;
    game_win = 1'b0;
    game_lose = 1'b0;
    game_idle = 1'b0;
    unique case (state)
      Start:
        if (keycode == 8'd44)
          next_state = Play;
      Play:
      begin
        if (~lives)
          next_state = Lose;
        else if (burger_done)
          next_state = Win;
      end
      Lose, Win:
        if (keycode == 8'd40)
          next_state = Start;
    endcase

    case (state)
      Start:
      begin
        game_idle = 1'b1;
      end
      Play:
      begin
        game_start = 1'b1;
      end
      Win:
      begin
        game_win = 1'b1;
      end
      Lose:
      begin
        game_lose = 1'b1;
      end
    endcase
  end
endmodule