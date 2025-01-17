module Display
  def display_greeting
    "Let's play a round of Mastermind!"
  end

  def display_ask_username
    'By which name are you known by?'
  end

  def display_name_prompt
    'Please enter your username.'
  end

  def display_game_explanation
    'Enter 1 color at a time, 3 times, to make your guess.\nUsing the feedback, continue guessing until you guess all 3 colors in the correct positions!'
  end
  
  def display_entry_prompt(entry_number)
    "Please submit entry \##{entry_number}."
  end

  def display_player_guesses(player_guesses)
    "You guessed #{player_guesses[0]}, #{player_guesses[1]}, and #{player_guesses[2]}."
  end

  def display_guess_results(right_color, right_spot, guess_number)
    "Correct color wrong spot: #{right_color}.\nCorrect color correct spot: #{right_spot}.\n#{5 - guess_number} guess(es) remaining.\n"
  end

  def display_game_won
    "Congratulations, you're a weiner!"
  end

  def display_game_loss(color1, color2, color3)
    "Sorry pal, you're fresh out of chances. The answers were #{color1}, #{color2}, and #{color3}, in that order."
  end

  def display_ask_restart_game
    "Want to play again? Enter y for 'yes' or n for 'no'."
  end

  def display_goodbye_message
    "Thanks for playing!"
  end
  def display_comp_guess_prompt(guess_num)
    sleep(1)
    "And here comes guess \##{guess_num} for Megatron."
  end
  def display_pick_or_guess
    "Would you like to pick the colors or guess the colors?\nPress 'p' for pick or 'g' for guess."
  end


end
