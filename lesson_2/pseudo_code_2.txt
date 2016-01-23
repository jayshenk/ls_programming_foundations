2. a method that takes an array of strings, and returns a string that is all those strings concatenated together

Casual:

Given an array of strings. 

Save a new blank string.
Iterate through the array of strings
  - append each string to the saved string

After iterating through the array, return the saved string.


Formal:

START

# Given an array of strings

SET new_string = a blank string
SET iterator = 1

WHILE iterator < length of strings array
  SET current_string = value in strings array at space "iterator"
  SET new_string = its current value plus the current_string

  iterator = iterator + 1

PRINT new_string

END