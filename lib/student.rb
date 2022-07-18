require_relative 'person'

class Student < Person
  def initialize(classroom, age, name)
    super(age, name)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end

sam = Student.new(3, 19, 'Sam')
p sam
