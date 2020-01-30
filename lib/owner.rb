require 'pry' 

class Owner
  attr_reader :name, :species

  @@all = [] 

  def initialize(name, species = "human")
    @name = name 
    @species = species 
    @@all << self 
  end 

  def self.all 
    @@all 
  end 

  def say_species 
    "I am a #{self.species}."
  end 

  def self.count
    self.all.count
  end 

  def self.reset_all 
    self.all.clear 
  end 

  def cats 
    Cat.all.select{|cat| cat.owner == self }
  end 

  def dogs 
    Dog.all.select{|dog| dog.owner == self }
  end 

  def buy_cat(name)
    cat = Cat.new(name, self)
  end 

  def buy_dog(name)
    dog = Dog.new(name, self)
  end 

  def walk_dogs 
    Dog.all.each {|dog| dog.mood = "happy"}
  end

  def feed_cats 
    Cat.all.each {|cat| cat.mood = "happy"}
  end 


  def sell_pets 
    Dog.all.each {|dog| dog.mood = "nervous"}
    Cat.all.each {|cat| cat.mood = "nervous"}
    Dog.all.each{|dog| dog.owner = nil}
    Cat.all.each{|cat| cat.owner = nil}
  end 

  def list_pets 
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end 

end