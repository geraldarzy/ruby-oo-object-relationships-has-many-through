class Waiter

    attr_accessor :name, :years

    @@all = []

    def initialize(name, years)
        @name = name
        @years = years
        save

    end

    def save
        self.class.all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer,total,tip)
            Meal.new(self,customer,total,tip)


    end

    def meals
        Meal.all.select {|x|x.waiter == self}
    end

    def best_tipper
        best = meals.max do |a,b|
            a.tip<=>b.tip
        end
        best.customer
    end

end