require "pry"
class Owner

  @@all = []

  attr_accessor :pets, :name
  attr_reader :species

  def initialize(species)
    @species = species
    @@all << self
    @pets = {:fishes => [], :cats => [], :dogs => []}
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def species
    @species
  end

  def say_species
    return "I am a #{@species}."
  end

  def buy_fish(name_of_fish)
    fish = Fish.new(name_of_fish)
    @pets[:fishes] << fish
  end

  def buy_cat(name_of_cat)
    cat = Cat.new(name_of_cat)
    @pets[:cats] << cat
  end

  def buy_dog(name_of_dog)
    dog = Dog.new(name_of_dog)
    @pets[:dogs] << dog
  end

  def walk_dogs
    @pets[:dogs].collect {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    @pets[:cats].collect {|cat| cat.mood = "happy"}
  end

  def feed_fish
    @pets[:fishes].collect {|fish| fish.mood = "happy"}
  end

  def sell_pets
    @pets.collect do |pet, name|
      name.each do |i|
        i.mood = "nervous"
      end
    end
    @pets.clear
  end


  def list_pets
    fish_number = @pets[:fishes].length
    cat_number = @pets[:cats].length
    dog_number = @pets[:dogs].length

    return "I have #{fish_number} fish, #{dog_number} dog(s), and #{cat_number} cat(s)."
  end
end

binding.pry
