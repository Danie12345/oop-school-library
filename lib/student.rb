require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, name, parent_permission)
    super(age, name, parent_permission: parent_permission)
    classroom.add_student(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
