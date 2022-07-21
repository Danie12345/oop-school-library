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

  def call_input(first)
    puts "What would you like to do #{first ? 'first' : 'next'}? (1 - 7)"
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given id'
    puts '7 - Exit'
    gets.chomp.strip
  end

  def cases(command)
    case command
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      puts 'creating a rental...'
    when '6'
      puts 'listing all rentals for the id...'
    end
  end

  def run
    puts 'Welcome to the School Library!'
    command = call_input(true)
    cases(command)
    while command != '7'
      puts ' '
      command = call_input(false)
      cases(command)
    end
    puts ' '
    puts 'Leaving the school... Goodbye!'
  end

  private

  def list_books
    puts 'There are no books yet!' if @books.empty?
    @books.each do |book|
      puts "The book #{book.title} by #{book.author} appears in #{book.rentals.length} rentals."
    end
  end

  def list_person(person, type)
    puts "[#{type}] #{person.name} is #{person.age} years old and has an id #{person.id}."
  end

  def list_people
    @people.each do |type, group|
      puts "There are no #{type}s yet!" if group.empty?
      group.each do |person|
        list_person(person, type)
      end
    end
  end

  def create_person
    type = [(print 'Do you want to create a student or a teacher? '), gets.rstrip][1]
    name = [(print 'Name: '), gets.rstrip][1]
    age = [(print 'Age: '), gets.rstrip][1]
    case type
    when 'student'
      perm = [(print 'Has parent\'s permission? (y/n) '), gets.rstrip][1]
      perms = { 'y' => true, 'n' => false }[perm]
      @people['student'] << Student.new(@classroom, age, name, perms)
    when 'teacher'
      spesh = [(print 'What\'s the teacher\'s specialization? '), gets.rstrip][1]
      @people['teacher'] << Teacher.new(spesh, age, name)
    end
  end

  def create_book
    title = [(print 'Title: '), gets.rstrip][1]
    author = [(print 'Author: '), gets.rstrip][1]
    @books << Book.new(title, author)
  end
end
