SUITS = ['H', 'D', 'C', 'S']
NAMED_CARDS = ['J', 'Q', 'K', 'A']
FULL_NAMES = { 'H' => 'Hearts', 'D' => 'Diamonds', 'C' => 'Clubs', 'S' => 'Spades',
               'J' => 'Jack', 'Q' => 'Queen', 'K' => 'King', 'A' => 'Ace' }

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  deck = []
  SUITS.each do |suit|
    ('2'..'10').each do |num|
      deck << [suit, num]
    end

    NAMED_CARDS.each do |name|
      deck << [suit, name]
    end
  end
  deck.shuffle!
  deck
end

def deal_cards!(dck, player_cards, dealer_cards)
  2.times do
    player_cards << dck.pop
    dealer_cards << dck.pop
  end
end

def card_names(cards, hidden=false)
  names = []
  cards.each do |card|
    card_name = ""
    if NAMED_CARDS.include?(card[1])
      card_name += FULL_NAMES[card[1]]
    else
      card_name += card[1]
    end
    card_name += " of #{FULL_NAMES[card[0]]}"
    names << card_name
  end

  if hidden
    names = "#{names[0]} and unknown card."
  else
    names = names.join(', ')
  end

  names
end

def display_table(player_cards, dealer_cards, hidden=false)
  system 'clear'
  prompt "Dealer has: #{card_names(dealer_cards, hidden)}"
  prompt "You have: #{card_names(player_cards)}"
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
    sum -= 10 if sum > 21
  end

  sum
end

def detect_winner(player_cards, dealer_cards)
  if total(player_cards) > total(dealer_cards)
    'You'
  elsif total(dealer_cards) > total(player_cards)
    'Dealer'
  else
    nil
  end
end

def someone_won?(player_cards, dealer_cards)
  !!detect_winner(player_cards, dealer_cards)
end

def display_results(player_cards, dealer_cards)
  prompt "Dealer total: #{total(dealer_cards)}"
  prompt "Your total: #{total(player_cards)}"

  if busted?(player_cards)
    prompt "You busted! You lose..."
  elsif busted?(dealer_cards)
    prompt "Dealer busted! You win!"
  elsif someone_won?(player_cards, dealer_cards)
    prompt "#{detect_winner(player_cards, dealer_cards)} won!"
  else
    prompt "It's a tie!"
  end
end

def busted?(cards)
  total(cards) > 21
end

loop do
  deck = initialize_deck

  player = []
  dealer = []

  deal_cards!(deck, player, dealer)
  display_table(player, dealer, true)

  # Player turn
  answer = nil
  loop do
    prompt "Hit or stay?"
    answer = gets.chomp.downcase
    if answer.start_with?('h')
      player << deck.pop
      prompt "You hit."
      display_table(player, dealer, true)
      break if busted?(player)
    elsif answer.start_with?('s')
      prompt "You stay."
      break
    else
      prompt "That's not a valid choice."
    end
  end

  unless busted?(player)
    # Dealer's turn
    loop do
      if total(dealer) < 17
        dealer << deck.pop
      else
        break
      end
    end
  end

  # Results
  display_table(player, dealer)
  display_results(player, dealer)

  prompt "Play again?"
  choice = gets.chomp.downcase
  break unless choice.start_with?('y')
end

prompt "Thank you for playing Twenty-One! Goodbye."
