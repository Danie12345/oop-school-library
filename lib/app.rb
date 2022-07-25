require_relative 'classroom'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'

class App
  def initialize
    @people = { 'Student' => [], 'Teacher' => [] }
    @allpeople = []
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
    puts '6 - List all rentals for a given index'
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
      create_rental
    when '6'
      rentals_by_index
    end
  end

  def action(first)
    command = call_input(first)
    cases(command)
    command
  end

  def run(command)
    while command != '7'
      puts ' '
      command = action(false)
    end
  end

  private

  def list_books(index_b: false)
    if @books.empty?
      nobooksmsg = 'There are no books yet!'
      case index_b
      when true
        raise nobooksmsg
      when false
        puts nobooksmsg
      end
    end
    @books.each_with_index do |book, i|
      puts "#{"#{i}) " if index_b}The book #{book.title} by #{book.author} appears in #{book.rentals.length} rentals."
    end
  end

  def list_person(person, index, index_b)
    puts "#{if index_b
              "#{index}) "
            end}[#{person.class}] #{person.name} is #{person.age} years old and has an id #{person.id}."
  end

  def list_people(index_b: false)
    index = 0
    @people.each do |type, group|
      if group.empty?
        puts "There are no #{type}s yet!" unless index_b
      else
        group.each do |person|
          list_person(person, index, index_b)
          index += 1
        end
      end
    end
  end

  def add_person(person)
    @people[person.class.to_s] << person
    @allpeople = @people['Student'] + @people['Teacher']
    puts "#{person.class} created successfully"
  end

  def create_person
    type = [(print 'Do you want to create a student or a teacher? '), gets.rstrip][1]
    name = [(print 'Name: '), gets.rstrip][1]
    age = [(print 'Age: '), gets.rstrip][1]
    case type
    when 'student'
      perms = [(print 'Has parent\'s permission? (y/n) '), gets.rstrip][1].downcase == 'y'
      add_person(Student.new(@classroom, age, name, perms))
    when 'teacher'
      spesh = [(print 'What\'s the teacher\'s specialization? '), gets.rstrip][1]
      add_person(Teacher.new(spesh, age, name))
    else
      puts 'That type of person is not yet implemented!'
    end
  end

  def create_book
    title = [(print 'Title: '), gets.rstrip][1]
    author = [(print 'Author: '), gets.rstrip][1]
    @books << Book.new(title, author)
  end

  def choose_obj(msg, type_func, obj_list)
    puts msg
    case type_func
    when :list_books
      list_books(index_b: true)
    when :list_people
      list_people(index_b: true)
    end
    obj_index = gets.chomp.strip.to_i
    obj_list[obj_index]
  end

  def create_rental
    date = [(print 'Type in the current date [dd/mm/yyyy]: '), gets.rstrip][1]
    book = choose_obj('Choose a book from the following by index: ', :list_books, @books)
    person = choose_obj('Choose a person from the following by index: ', :list_people, @allpeople)
    rental = Rental.new(date)
    book.add_rental(rental)
    person.add_rental(rental)
    @rentals << rental
  end

  def rentals_by_index
    if @allpeople.empty?
      puts 'There are no people in the registry'
      return
    end
    person = choose_obj('Choose a person from the following by index to retrieve their rentals: ', :list_people,
                        @allpeople)
    puts "#{person.name} has no rentals yet!" if person.rentals.empty?
    person.rentals.each do |rental|
      puts "#{person.name} rented the book #{rental.book.title} on #{rental.date}"
    end
  end
end
