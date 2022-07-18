require_relative 'person'

class Teacher < Person
  def initialize(specialization, age, name)
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

cal = Teacher.new(3, 38, 'Cal')
p cal
