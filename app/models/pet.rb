class Pet < ActiveRecord::Base
    belongs_to :shelter 
    belongs_to :adopter 

    #spot check value in table
    def self.oldest 
        #Pet.maximum('age') this would be ok but don't tell them that
        Pet.all.max_by do |pet|
            pet[:age]
        end 
    end 

    #manually add
    #open up sqlite and test with sql
    #SELECT AVG(age) FROM pets;
    def self.average_age 
        Pet.average('age').to_i
    end 

    #test row that is dog
    #test row that isn't dog
    def in_dog_years 
        if self.species == 'dog'
            self.age * 5
        end
    end 
end
