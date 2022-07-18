require_relative 'person'

class Student < Person
  def initialize(classroom, _age, _name, _parent_permission)
    super()
    @classroom = classroom
  end
end
