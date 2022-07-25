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

  def description(index = 0, index_b: false)
    "#{"#{index}) " if index_b}[#{self.class}] #{@name} is #{@age} years old," \
      " they#{" don't" unless @parent_permission} have their parent's permission and has an id #{@id}."
  end
end
