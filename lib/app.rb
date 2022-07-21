class App
  def initialize
    @people = { 'student' => [], 'teachers' => [] }
    @books = []
    @rentals = []
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
    @people['student'].each do |person|
      list_person(person, 'student')
    end
    @people['teacher'].each do |person|
      list_person(person, 'teacher')
    end
  end
end
