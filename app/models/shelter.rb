class Shelter < ActiveRecord::Base
    #shelter with one pet, 
    #shelter with no pets, 
    #shelter with multiple pets
    has_many :pets 
    has_many :adopters, through: :pets 

    #test shelter with no pets
    #test shelter with some current pets
    #test shelter with all current pets
    def current_pets 
        self.pets.where(adopted?: false)
    end 

    def adopted_pets 
        self.pets.where(adopted?: true)
    end 
end
