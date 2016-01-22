statement = "The Flintstones Rock"

frequency = Hash.new(0)

statement.gsub(/\s/, '').split('').each do |letter|
  frequency[letter] += 1
end
