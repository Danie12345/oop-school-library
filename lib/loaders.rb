require 'json'

require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'

module Loaders
  def load_people(people, allpeople = [])
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

  def load_books(books = [])
    file = JSON.parse(File.read('books.json'), object_class: Struct)
    file.each do |buk|
      props = JSON.parse(buk)['props']
      title = props[0]
      author = props[1]
      id = props[2]
      books << Book.new(title, author, id)
    end
    books
  end

  def load_rentals(people, books, rentals = [])
    file = JSON.parse(File.read('rentals.json'), object_class: Struct)
    file.each do |rent|
      props = JSON.parse(rent)['props']
      date = props[0]
      bookid = props[1]
      personid = props[2]
      rental = Rental.new(date)
      book = find(bookid, books)
      person = find(personid, people)
      book.add_rental(rental)
      person.add_rental(rental)
      rentals << rental
    end
    rentals
  end

  def find(id, items)
    items.each do |item|
      return item if item.id == id
    end
  end
end
