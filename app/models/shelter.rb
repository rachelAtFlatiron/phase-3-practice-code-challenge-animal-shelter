class Shelter < ActiveRecord::Base
    has_many :pets 
    has_many :adopters, through: :pets

    #test shelter where all pets adopted
    #test shelter where no pets adopted
    #test shelter where some pets adopted
    #test shelter with no pets
    def current_pets 
        self.pets.select do |pet|
            !pet.adopted?
        end
    end 

    #test if current_pets.length + adopted_pets.length == pets.length
    def adopted_pets 
        self.pets.select do |pet|
            pet.adopted?
        end
    end 
end
