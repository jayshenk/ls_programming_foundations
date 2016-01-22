def factors(number)
  dividend = number
  divisors = []
  while dividend > 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

# Bonus 1:
# This ensures that the dividend divides the number evenly with no remainder.
# This code ensures that we don't include floats as divisors. 

# Bonus 2:
# Since methods implicitly return the last line of the method, the divisors
# is placed there so that it is the value being returned.
