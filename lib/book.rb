class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    rental.book = self
    @rentals.push(rental) unless @rentals.include?(rental)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'props' => [@title, @author]
    }.to_json(*args)
  end

  def json_create(object)
    new(*object['props'])
  end
end
