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

bugs = Speaker.find_by(name: names[0])
wile = Speaker.find_by(name: names[1])
sam = Speaker.find_by(name: names[2])

bugs.presentations.find_or_create_by(title: "What's up with Docs?")
bugs.presentations.find_or_create_by(title: "Of course, you know, this means war.")

wile.presentations.find_or_create_by(title: "Getting the most from the Acme categlog.")

sam.presentations.find_or_create_by(title: "Shaaaad up!")
sam.presentations.find_or_create_by(title: "Ah hates rabbits.")
sam.presentations.find_or_create_by(title: "The Great horni-todes")
