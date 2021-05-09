module game_score (
  input logic clock, reset, game_start, 
  input logic [3:0] burger_ingredients, 
  input logic [1:0] lives, 
  output logic [8:0] score
);

logic [5:0] frame_count, next_frame_count;
logic [8:0] timer, next_timer, reg_score;

  always_ff @ (posedge clock)
  begin
    if (reset)
    begin
      timer <= 9'd300;
      frame_count <= 6'd60;
      reg_score <= 0;
    end
    else
    begin
      timer <= next_timer;
      frame_count <= next_frame_count;
      if (!next_frame_count && game_start)
        reg_score <= timer + 15 * burger_ingredients - 60 * (3 - lives);
      if (reg_score < 0)
        reg_score <= '0;
    end
  end

  always_comb
  begin
    if (timer && !frame_count)
      next_timer = timer - 1;
    else
      next_timer = timer;
    if (frame_count)
      next_frame_count = frame_count - 1;
    else
      next_frame_count = 6'd60;
  end

  assign score = reg_score;

endmodule