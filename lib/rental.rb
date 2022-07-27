require 'date'

class Rental
  attr_accessor :date, :book, :person

  def initialize(date)
    @date = date
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'props' => [@date, @book.id, @person.id]
    }.to_json(*args)
  end

  def json_create(object)
    new(*object['props'])
  end
end
