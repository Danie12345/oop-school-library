require_relative 'person'

class Student < Person
  def initialize(age, name, parent_permission)
    super(age, name, parent_permission: parent_permission)
  end

  def description(index = 0, index_b: false)
    "#{"#{index}) " if index_b}[#{self.class}] #{@name} is #{@age} years old," \
      " they#{" don't" unless @parent_permission} have their parent's permission and has an id #{@id}."
  end
end
