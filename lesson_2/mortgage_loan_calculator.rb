def prompt(message)
  puts "=> #{message}"
end

loop do
  prompt("Welcome to Mortgage Calculator!")

  amount = ''
  loop do
    prompt("What is the loan amount?")
    amount = gets.chomp

    if amount.empty? || amount.to_f < 0
      prompt("Must enter positive number.")
    else
      break
    end
  end

  apr = ''
  loop do
    prompt("What is the Annual Percentage Rate (APR)?")
    prompt("(Example: 5 for 5% or 2.5 for 2.5%)")

    apr = gets.chomp
    if apr.empty? || apr.to_f < 0
      prompt("Must enter positive number.")
    else
      break
    end
  end

  months = ''
  loop do
    prompt("What is the loan duration in months?")
    months = gets.chomp
    if months.empty? || months.to_i < 0
      prompt("Enter a valid number")
    else
      break
    end
  end

  monthly_interest_rate = (apr.to_f / 100) / 12

  monthly_payment = amount.to_f * (monthly_interest_rate * (1 + monthly_interest_rate)**months.to_i) /
                    ((1 + monthly_interest_rate)**months.to_i - 1)

  prompt("Your monthly mortgage payment is $#{format('%02.2f', monthly_payment)}.")

  prompt("Would you like to make another calculation?")
  answer = gets.chomp

  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for using the Morgage Calculator!")
prompt("Good bye!")
