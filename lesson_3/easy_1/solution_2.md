! and ? in Ruby can mean and do different things depending on the context. 

1. != is a comparison operator meaning "does not equal." You can use it to check to see
if one value is not equal to another value. For instance, 1 != 2 returns true. 

2. When ! is put before something, like !user_name, it reverses the boolean true or false,
making something that evaluates as true instead evaluate to false and vice versa.

3. When ! is after something, like words.uniq!, it usually means the method mutates the 
caller (it is destructive). 

4. When ? is before something it may be being used as part of a ternary operator (shorthand
for an if/else statement). For example: 
2 > 1 ? "Two is greater than one." : "Two is not greater than one."

5. ? is used at the end of a method as a convention for a method that returns a boolean. 

6. !! before something, like !!user_name, changes the boolean value twice, so that if user_name
evaluates to true, the first ! would make it false and the second ! would make it true. 