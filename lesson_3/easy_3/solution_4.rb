advice = "Few things in life are as important as house training your pet dinosaur."

advice.slice!(0, advice.index('house'))

# Bonus: If you use the String#slice method instead you return the correct value but
# the advice variable does not change.
