require 'faker'

10.times do 
    Shelter.create(name: Faker::Lorem.word, address: Faker::Address.full_address)
end 

10.times do 
    Adopter.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end 

#Create seed data for pets