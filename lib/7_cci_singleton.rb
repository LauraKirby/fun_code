# chapter 7: object-oriented design
# cracking the coding interview

# create a singleton class
# ensures that a class hos only one instance and
# ensures access throughout the application.

require 'singleton'

class Restaurant
  include Singleton

  attr_accessor :getInstance, :name, :address

  def initialize
    @name = "Nopal"
    @address = "123 Market Street"
  end

  def getInstance
    if _instance == null
      _instance = new(Restaurant)
    end
  end

  def print_address
    puts self.address
  end

end

# print the number of object instances of this class
# => 0
puts ObjectSpace.each_object(Restaurant){}

r = Restaurant.instance

# print the number of object instances of this class
# => 1
puts ObjectSpace.each_object(Restaurant){}

r.address = "hello"

r.print_address

# no new instance is created when calling
# "instance" a second time
# c = Restaurant.instance

# since a new Restaurant was not created,
# print_address witll still print "hello"
# c.print_address

# print the number of object instances of this class
# => 1
puts ObjectSpace.each_object(Restaurant){}