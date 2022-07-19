require_relative 'base_decorator'

class TrimDecorator < BaseDecorator
  def correct_name
    super()
    @nameable.correct_name[0...10]
  end
end
