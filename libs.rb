require "json"

my_hash =  {:animal => "dog", :plant => "flower", :fish => "Nemo"}

puts my_hash.to_json

class JohnError < StandardError
  
end


class Person
  
  #create the peson object and store their name
  def initialize(name)
    begin
    raise JohnError, "Your name is really Thelma" if name == "John"
    @name = name
    rescue => e
      @name = e
    end
    
  end
  
  #return the persons name
  def name
    @name
  end
  
  #return the persons name and title
  def name_and_title(name)
    "Mr #{name}"
  end
  
  #return the nowhere man
  def mister_nobody
    "Nowhere man"
  end
  
end

freddy = Person.new("Fred")
puts freddy.name
john = Person.new('John')
puts john.name
puts john.mister_nobody
puts john.name_and_title("bob")