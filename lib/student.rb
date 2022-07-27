require_relative 'person'

class Student < Person
  def initialize(age, name, id = SecureRandom.uuid, parent_permission: true)
    super(age, name, id, parent_permission: parent_permission)
  end

  def description(index = 0, index_b: false)
    "#{"#{index}) " if index_b}[#{self.class}] #{correct_name} is #{@age} years old, " \
      "they#{" don't" unless @parent_permission} have their parent's permission and has an id #{@id}."
  end
end
