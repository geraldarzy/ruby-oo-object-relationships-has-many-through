require 'pry'
class Customer

    attr_accessor :name, :age

    @@all = []

    def initialize(name, age)
        @name = name
        @age = age
        save

    end

    def save
        self.class.all << self
    end

    def self.all
        @@all 
    end

    def new_meal(waiter, total, tip)
        Meal.new(waiter,self,total,tip)
        

    end

    def meals
        Meal.all.select{|x|x.customer == self}
    end
    def waiters
        meals.map do |meal|
            meal.waiter
          end
            #binding.pry
    end
  
end