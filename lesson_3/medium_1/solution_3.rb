# It is an error because you can't add a string to an integer.

# One way to fix this:
puts "the value of 40 + 2 is " + (40 + 2).to_s

# Second way:
puts "the value of 40 + 2 is #{40 + 2}"
