require 'json'

require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'

module Loaders
  def loadpeople(people, allpeople)
    file = File.read('people.txt').split("\n")
    file.each do |line|
      prsn = JSON.parse(line, object_class: Hash)
      props = prsn['props']
      id = props[0]
      age = props[1].to_i
      name = props[2]
      last = props[3]
      case prsn['json_class']
      when 'Student'
        person = Student.new(age, name, id, parent_permission: last)
      when 'Teacher'
        person = Teacher.new(age, name, last, id)
      end
      people[person.class.to_s] << person
      allpeople << person
    end
    [people, allpeople]
  end
end
