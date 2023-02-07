require 'faker'

10.times do 
    Shelter.create(name: Faker::Lorem.word, address: Faker::Address.full_address)
end 

10.times do 
    Adopter.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end 

10.times do 
    Pet.create(name: Faker::Movies::HarryPotter.character, 
        age: rand(20), 
        species: Faker::Creature::Animal.name,
        adopted?: false,
        shelter_id: Shelter.all.sample.id,
        adopter_id: nil
    )
end

10.times do 
    Pet.create(name: Faker::Movies::HarryPotter.character, 
        age: rand(20), 
        species: "dog",
        adopted?: true,
        shelter_id: Shelter.all.sample.id,
        adopter_id: Adopter.all.sample.id
    )
end

#Create seed data for pets