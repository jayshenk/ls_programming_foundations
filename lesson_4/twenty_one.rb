SUITS = ['H', 'D', 'C', 'S']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
WIN_NUM = 21
DEALER_MIN = 17

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end

  # correct for Aces
  values.count { |value| value == "A" }.times do
    sum -= 10 if sum > WIN_NUM
  end

  sum
end

def busted?(cards)
  total(cards) > WIN_NUM
end

def detect_result(player_cards, dealer_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total > WIN_NUM
    :player_busted
  elsif dealer_total > WIN_NUM
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(player_cards, dealer_cards)
  result = detect_result(player_cards, dealer_cards)

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def score_result(player_cards, dealer_cards, score)
  result = detect_result(player_cards, dealer_cards)
  case result
  when :player_busted
    score[:dealer] += 1
  when :dealer_busted
    score[:player] += 1
  when :player
    score[:player] += 1
  when :dealer
    score[:dealer] += 1
  when :tie
    score[:ties] += 1
  end
end

def display_score(score)
  prompt "Dealer Wins: #{score[:dealer]}"
  prompt "Player Wins: #{score[:player]}"
  prompt "Ties: #{score[:ties]}"
end

def display_table(player_cards, dealer_cards)
  puts "=============="
  prompt "Dealer has #{dealer_cards}, for a total of: #{total(dealer_cards)}"
  prompt "Player has #{player_cards}, for a total of: #{total(player_cards)}"
  puts "=============="
end

def display_end_round(player_cards, dealer_cards, score)
  display_table(player_cards, dealer_cards)
  display_result(player_cards, dealer_cards)
  display_score(score)
end

def display_winner(score)
  if score[:player] == 5
    prompt "You are the overall winner!"
  elsif score[:dealer] == 5
    prompt "The dealer is the overall winner!"
  end
end

def game_over?(score)
  score[:player] == 5 || score[:dealer] == 5
end

def play_again?
  puts "-------------"
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

score = { player: 0, dealer: 0, ties: 0 }

loop do
  prompt "Welcome to Twenty-One!"

  # initialize vars
  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  # initial deal
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end

  prompt "Dealer has #{dealer_cards[0]} and ?"
  prompt "You have: #{player_cards[0]} and #{player_cards[1]}, for a total of #{total(player_cards)}."

  # player turn
  loop do
    player_turn = nil
    loop do
      prompt "Would you like to (h)it or (s)tay?"
      player_turn = gets.chomp.downcase
      break if ['h', 's'].include?(player_turn)
      prompt "Sorry, you must enter 'h' or 's'."
    end

    if player_turn == 'h'
      player_cards << deck.pop
      prompt "You chose to hit!"
      prompt "Your cards are now: #{player_cards}"
      prompt "Your total is now: #{total(player_cards)}"
    end

    break if player_turn == 's' || busted?(player_cards)
  end

  if busted?(player_cards)
    score_result(player_cards, dealer_cards, score)
    display_end_round(player_cards, dealer_cards, score)
    break if game_over?(score)
    play_again? ? next : break
  else
    prompt "You stayed at #{total(player_cards)}"
  end

  # dealer turn
  prompt "Dealer turn..."

  loop do
    break if busted?(dealer_cards) || total(dealer_cards) >= DEALER_MIN

    prompt "Dealer hits!"
    dealer_cards << deck.pop
    prompt "Dealer's cards are now: #{dealer_cards}"
  end

  if busted?(dealer_cards)
    score_result(player_cards, dealer_cards, score)
    display_end_round(player_cards, dealer_cards, score)
    break if game_over?(score)
    play_again? ? next : break
  else
    prompt "Dealer stays."
  end

  # both player and dealer stay - compare cards!
  score_result(player_cards, dealer_cards, score)
  display_end_round(player_cards, dealer_cards, score)
  break if game_over?(score)
  break unless play_again?
end

display_winner(score)
prompt "Thank you for playing Twenty-One! Goodbye."
