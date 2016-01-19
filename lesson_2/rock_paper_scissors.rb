VALID_CHOICES = %w(rock paper scissors lizard spock)
HIERARCHY = { 'rock' => %w(scissors lizard),
              'paper' => %w(rock spock),
              'scissors' => %w(paper lizard),
              'lizard' => %w(paper spock),
              'spock' => %w(scissors rock) }
LETTER = { 'r' => 'rock',
           'p' => 'paper',
           'l' => 'lizard',
           'c' => 'scissors',
           'v' => 'spock' }

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  HIERARCHY[first].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def display_score(player_points, computer_points, draws)
  prompt("Score:
          You: #{player_points}
          Computer: #{computer_points}
          Ties: #{draws}")
end

player_score = 0
computer_score = 0
ties = 0
loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

    while choice.length == 1
      if LETTER.include?(choice)
        choice = LETTER[choice]
      elsif choice == 's'
        prompt("Did you mean scissors or spock? Type 'c' for scissors or 'v' for spock.")
        choice = Kernel.gets().chomp()
      else
        break
      end
    end

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  Kernel.puts("You chose: #{choice}; Computer chose: #{computer_choice}")

  if win?(choice, computer_choice)
    player_score += 1
  elsif win?(computer_choice, choice)
    computer_score += 1
  else
    ties += 1
  end

  display_results(choice, computer_choice)
  display_score(player_score, computer_score, ties)

  if player_score == 5
    prompt("You are the overall winner!")
    break
  elsif computer_score == 5
    prompt("The computer is the overall winner!")
    break
  end
end

prompt("Thank you for playing. Good bye!")
