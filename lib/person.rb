require 'securerandom'

class Person
  attr_reader :id, :rentals, :parent_permission
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', id = SecureRandom.uuid, parent_permission: true)
    super()
    @id = id
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

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'props' => [@id, @age, @name, @parent_permission]
    }.to_json(*args)
  end

  def json_create(object)
    new(*object['props'])
  end
end
