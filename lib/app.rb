class App
  def initialize
    @people = { 'people' => [], 'teachers' => [] }
    @books = []
    @rentals = []
  end

  def list_books
    @books.each do |book|
      puts "The book #{book.title} by #{book.author} appears in #{book.rentals.length} rentals."
    end
  end
end
