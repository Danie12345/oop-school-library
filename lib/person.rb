require 'securerandom'
require_relative 'nameable'

class Person < Nameable
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

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    rental.person = self
    @rentals.push(rental) unless @rentals.include?(rental)
  end

  def description(index = 0, index_b: false)
    "#{"#{index}) " if index_b}[#{self.class}] #{@name} is #{@age} years old and has an id #{@id}."
  end
end
