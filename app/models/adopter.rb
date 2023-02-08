class Adopter < ActiveRecord::Base
    has_many :pets 
    #test for one
    #test for none
    #test for multiple
    has_many :shelters, through: :pets 

    def full_name 
        "#{self.first_name} #{self.last_name}"
    end 


    def adopt(pet)
        #without check, update will overwrite adopter_id if already adopted
        if !pet.adopted?
            pet.update(adopter_id: self.id, adopted?: true)
        else  
            "Already adopted" 
        end 
    end

    # def old_fav_pet 
    #     #get list of all pets
    #     #check if empty, return nil if true 
    #     #group by species

    #      #self.pets.group_by(&:species)
    #     species_hash = self.pets.group_by { |pet| pet.species }
    #     puts species_hash
    #     highest_count = species_hash.max_by { |name, entries| entries.length} 
    #     #get the value with longest length
    #     return highest_count[0]
    # end 

    def fav_pet 
        #replace each active record with species name
        if self.pets.length == 0 
            return nil 
        end 
        #self.pets.map { |pet| pet.species }
        species_arr = self.pets.map do |pet| 
            pet.species 
        end 
        #species_arr.max_by { |species| species_arr.count(species) }
        species_arr.max_by do |species| 
            species_arr.count(species) 
        end 
    end 
end
