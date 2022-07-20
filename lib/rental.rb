require 'date'

class Rental
  attr_accessor :date, :book, :person

  def initialize
    @date = DateTime.now
  end
end
