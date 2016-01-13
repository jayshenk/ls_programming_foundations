3. a method that takes an array of integers, and returns a new array with every other element

Casual:

Given an array of integers.
Save a new empty array.

Iterate through the array one by one.
  - If the iterator number is evenly divisible by 2, add it to the new array.

After iterating through the array, return the new array.


Formal:

START

# Given an array of integers.

SET new_array = empty array
SET interator = 1

WHILE iterator < length the array of integers
  SET current_nuimber = value in integers array at space "iterator"
  IF iterator % 2 = 0
    add current_value to the new_array
  ELSE
    go to the next iteration

  iterator = iterator + 1

PRINT new_array

END