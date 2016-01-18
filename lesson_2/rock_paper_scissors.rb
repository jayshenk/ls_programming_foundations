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

  display_results(choice, computer_choice)

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Good bye!")