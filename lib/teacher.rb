require_relative 'person'

class Teacher < Person
  def initialize(specialization, age, name)
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def description(index = 0, index_b: false)
    "#{if index_b
         "#{index}) "
       end}[#{self.class}] #{@name} is #{@age} years old, specialized #{@specialization} and has an id #{@id}."
  end
end
