require 'securerandom'

class Person
  attr_reader :id, :rentals
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = SecureRandom.uuid
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(rental)
    rental.person = self
    @rentals.push(rental) unless @rentals.include?(rental)
  end

  def description(index = 0, index_b: false)
    "#{"#{index}) " if index_b}[#{self.class}] #{@name} is #{@age} years old and has an id #{@id}."
  end

  def correct_name
    @name.capitalize
  end
end
