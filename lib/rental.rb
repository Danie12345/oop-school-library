require 'date'

class Rental
  attr_accessor :date, :book

  def initialize
    @date = DateTime.now
  end
end
