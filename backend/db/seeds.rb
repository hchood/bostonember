names = [
  "Bugs Bunny",
  "Wile E. Coyote",
  "Yosemite Sam"
]

names.each do |name|
  speaker = Speaker.find_by(name: name)
  if !speaker.nil?
    puts "#{name} already in database."
  else
    Speaker.create(name: name)
    puts "#{name} created."
  end
end
