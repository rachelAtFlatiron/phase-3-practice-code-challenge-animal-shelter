require 'faker'

#reset
    #1. destroy tables 
    #2. rebuilds tables
    #3. reseeds

#db:seed:replant
    #1. clears table
    #2. reseeds 

#delete all records that existed before running seed file
Pet.destroy_all
Shelter.destroy_all 
Adopter.destroy_all

10.times do 
    Shelter.create(name: Faker::Lorem.word, address: Faker::Address.full_address)
end 

7.times do 
    Adopter.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end 

#Create seed data for pets

#data for adopted? = true 
5.times do 
    Pet.create(name: Faker::Movies::HitchhikersGuideToTheGalaxy.character,
        age: rand(1...20),
        species: Faker::Creature::Animal.name,
        adopted?: true,
        shelter_id: Shelter.all.sample.id, #rand(1...10)
        adopter_id: Adopter.all.sample.id
    )
end 

#data for adopted? = false
5.times do 
    Pet.create(name: Faker::Movies::HitchhikersGuideToTheGalaxy.character,
        age: rand(1...20),
        species: "dog",
        adopted?: true,
        shelter_id: Shelter.all.sample.id, #rand(1...10)
        adopter_id: Adopter.all.sample.id
    )
end 



# Pet.create(name: 'momo', age: 3, 
#     species: 'cat', adopted?: true, 
#     shelter_id: Shelter.all.sample.id, 
#     adopter_id: Adopter.all.sample.id)

# Pet.create(name: 'Dog', age: 7, 
#     species: 'dog', adopted?: false, 
#     shelter_id: Shelter.all.sample.id, #rand(1...10)
#     adopter_id: nil)

# Pet.create(name: 'gambit', age: 3, 
#     species: 'horse', adopted?: false, 
#     shelter_id: Shelter.all.sample.id, 
#     adopter_id: Adopter.all.sample.id)

# Pet.create(name: 'gorillaz', age: 3, 
#     species: 'dog', adopted?: true, 
#     shelter_id: Shelter.all.sample.id, 
#     adopter_id: Adopter.all.sample.id)
    
