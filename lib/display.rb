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
  
  def display_guess_prompt(guess_number)
    "Please submit guess \##{guess_number}. You can submit red, orange, yellow, green, blue, purple, black, or white."
  end
end
