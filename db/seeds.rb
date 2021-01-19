5.times do
    Note.create(title: Faker::Movies::StarWars.call_sign, content: Faker::Quote.yoda)
    Note.create(title: Faker::Movies::PrincessBride.character, content: Faker::Movies::PrincessBride.quote)
end