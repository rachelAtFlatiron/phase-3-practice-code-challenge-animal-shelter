class Pet < ActiveRecord::Base
    belongs_to :shelter 
    belongs_to :adopter

    def self.oldest 
        #all.max_by(&:age)
        #order("age DESC").first
        order(:age).last
    end 

    def self.average_age 
        average(:age).to_i
    end 

    def in_dog_years 
        #age * 5
        self.species == "dog" ? self.age * 5 : "This isn't a dog!"
    end 
end
