require 'date'

class Rental
  attr_accessor :date

  def initialize
    @date = DateTime.now
  end
end
