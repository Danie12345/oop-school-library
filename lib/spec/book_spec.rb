require_relative '../book'

describe Book do
  context 'When creating a new book object' do
    it 'should contain a title and author' do
      title = 'LOTR'
      author = 'Tolkien'
      book = Book.new(title, author)
      expect(book.id).to be_truthy
      expect(book.title).to eq 'LOTR'
      expect(book.author).to eq 'Tolkien'
      expect(book.rentals).to match_array([])
    end
  end
end
