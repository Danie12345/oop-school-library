require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, name, perms)
    super(age, name, perms)
    @classroom = classroom
    classroom.student << self
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
