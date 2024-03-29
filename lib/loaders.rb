require 'json'

require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'

module Loaders
  def load_people(people, file_name, classroom, allpeople = [])
    return [people, []] unless File.exist?(file_name)

    file = JSON.parse(File.read(file_name), object_class: Hash)
    file.each do |prsn|
      props = JSON.parse(prsn)['props']
      id = props[0]
      age = props[1].to_i
      name = props[2]
      last = props[3]
      case JSON.parse(prsn)['json_class']
      when 'Student'
        person = Student.new(classroom, age, name, id, parent_permission: last)
        classroom.add_student(person)
      when 'Teacher'
        person = Teacher.new(age, name, last, id)
      end
      people[person.class.to_s] << person
      allpeople << person
    end
    [people, allpeople]
  end

  def load_books(file_name, books = [])
    return [] unless File.exist?(file_name)

    file = JSON.parse(File.read(file_name), object_class: Hash)
    file.each do |buk|
      props = JSON.parse(buk)['props']
      title = props[0]
      author = props[1]
      id = props[2]
      books << Book.new(title, author, id)
    end
    books
  end

  def load_rentals(people, books, file_name, rentals = [])
    return [] unless File.exist?(file_name)

    file = JSON.parse(File.read(file_name), object_class: Hash)
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

  def load_all(people, people_file, classroom, books_file, rentals_file)
    people, allpeople = load_people(people, people_file, classroom)
    books = load_books(books_file)
    rentals = load_rentals(allpeople, books, rentals_file)
    [people, allpeople, books, rentals]
  end
end
