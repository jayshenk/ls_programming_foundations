ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

total_age = 0

ages.each_value { |age| total_age += age }

# or

ages.values.inject(:+)