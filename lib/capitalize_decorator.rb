require_relative 'base_decorator'

class CapitalizeDecorator < BaseDecorator
  def correct_name
    super()
    @nameable.correct_name.capitalize
  end
end
