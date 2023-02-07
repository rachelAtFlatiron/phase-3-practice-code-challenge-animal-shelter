class Adopter < ActiveRecord::Base
    has_many :pets 
    has_many :shelters, through: :pets

    def full_name 
        "#{self.first_name} #{self.last_name}"
    end 

    #spot check in table
    def adopt(pet)
        pet.update({adopter_id: self.id, adopted?: true})
    end

    #check for adopter with no pets
    #check for adopter with pets
    def fav_pet
        if self.pets.length === 0 
            return nil
        end
        
        self.pets
        .group_by{ |pet| pet.species }
        .max_by { |species| species[1].length } [1][0].species

        #group number of entries per species
        #select group with longest length
    end
end
