require 'erb'
require 'pry'

kids_data   = File.read('data/kids-data.txt')
nice_letter = File.read('templates/naughty_letter_template.txt.erb')

kids_data.each_line do |kid|

  kid_data_array = kid.split

  name     = kid_data_array[0]
  behavior = kid_data_array[1]
  toys     = kid_data_array[2..7]

  if toys.include?('Kaleidoscope')
    toys.delete('Kaleidoscope')
  else
  end
  selected_toy = toys.sample
  toys.delete(selected_toy)

  get_infraction_array = kid.split('|   ')
  select_infraction = get_infraction_array[1].to_s
  #removes newline character
  infraction = select_infraction.strip.gsub("\n", "")
  # binding.pry
  next unless behavior == 'naughty'

  filename    = 'letters/naughty/' + name + '.txt'
  letter_text = ERB.new(nice_letter, nil, '-').result(binding)

  puts "Writing #{filename}."
  File.write(filename, letter_text)

end

puts 'Done!'
