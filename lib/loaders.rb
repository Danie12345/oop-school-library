require 'json'

require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'

module Loaders
  def loadpeople(people, allpeople)
    file = JSON.parse(File.read('people.json'), object_class: Hash)
    file.each do |prsn|
      props = JSON.parse(prsn)['props']
      id = props[0]
      age = props[1].to_i
      name = props[2]
      last = props[3]
      case JSON.parse(prsn)['json_class']
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

  def load_books(books)
    file = JSON.parse(File.read('books.json'), object_class: Struct)
    file.each do |buk|
      props = JSON.parse(buk)['props']
      title = props[0]
      author = props[1]
      books << Book.new(title, author)
    end
    books
  end
end
