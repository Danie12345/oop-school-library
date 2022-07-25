require_relative 'person'

class Teacher < Person
  def initialize(specialization, age, name)
    super(age, name)
    @specialization = specialization
  end

  def description(index = 0, index_b: false)
    "#{"#{index}) " if index_b}[#{self.class}] #{correct_name} is #{@age} " \
      "years old, specialized in #{@specialization} and has an id #{@id}."
  end
end
