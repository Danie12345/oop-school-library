require 'securerandom'

class Book
  attr_accessor :title, :author
  attr_reader :rentals, :id

  def initialize(title, author, id = SecureRandom.uuid)
    @title = title
    @author = author
    @id = id
    @rentals = []
  end

  def add_rental(rental)
    rental.book = self
    @rentals.push(rental) unless @rentals.include?(rental)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'props' => [@title, @author, @id]
    }.to_json(*args)
  end

  def json_create(object)
    new(*object['props'])
  end
end
