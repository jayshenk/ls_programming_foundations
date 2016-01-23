def generate_UUID
  hex = ('0'..'9').to_a + ('a'..'f').to_a
  
  uuid_arr = []
  sections = [8, 4, 4, 4, 12]
  sections.each do |section|
    uuid_arr << hex.sample(section).join
  end
  uuid = uuid_arr.join('-')
  
  uuid
end
