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

  def call_input
    puts "What would you like to do first? (1 - 7) "
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given id'
    puts '7 - Exit'
    return gets.chomp
  end

  def cases(command)
    case command
    when '1'
      puts "listing all books..."
    when '2'
      puts "listing all people..."
    when '3'
      puts "creating a person..."
    when '4'
      puts "creating a book..."
    when '5'
      puts "creating a rental..."
    when '6'
      puts "listing all rentals for the id..."
    end
  end

  def run
    puts "Welcome to the School Library!"
    first = true
    command = self.call_input
    self.cases(command)
    while command != '7'
      puts ' '
      if first
        command = self.call_input
      end
      self.cases(command)
    end
    puts "Leaving the school... Goodbye!"
  end

  private

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
