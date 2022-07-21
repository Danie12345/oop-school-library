require_relative 'classroom'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'

class App
  def initialize
    @people = { 'student' => [], 'teacher' => [] }
    @books = []
    @rentals = []
    @classroom = Classroom.new('Room A')
  end

  def list_books
    @books.each do |book|
      puts "The book #{book.title} by #{book.author} appears in #{book.rentals.length} rentals."
    end
  end

  def list_person(person, type)
    puts "The #{type} #{person.name} is #{person.age} years old and has an id #{person.id}."
  end

  def list_people
    @people.each do |type, group|
      group.each do |person|
        list_people(person, type)
      end
    end
  end

  def create_person()
    puts 'Do you want to create a student or a teacher? '
    type = gets.chomp
    puts 'Name: '
    name = gets.chomp
    puts 'Age: '
    age = gets.chomp
    case type
    when 'student'
      puts 'Has parent\'s permission? (y/n) '
      perms = gets.chomp
      @people['student'] << Student.new(@classroom, age, name, perms)
    when 'teacher'
      puts 'What\'s the teacher\'s specialization? '
      spesh = gets.chomp
      @people['teacher'] << Teacher.new(spesh, age, name)
    end
  end
end
