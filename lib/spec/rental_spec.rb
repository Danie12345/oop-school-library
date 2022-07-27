require_relative '../person'
require_relative '../rental'
require_relative '../book'

describe Rental do
  context 'When creating a new rental object' do
    before(:each) do
      date = '27/07/22'
      title = 'LOTR'
      author = 'Tolkien'
      @book = Book.new(title, author)
      name = 'axel'
      age = 18
      id = 'ec9258f5-7b9f-4fd5-976a-d40ec7ddca09'
      @person = Person.new(age, name, id)
      @rental = Rental.new(date)
      @book.add_rental(@rental)
      @person.add_rental(@rental)
    end

    it 'should contain a date, book and person' do
      expect(@rental.date).to eq '27/07/22'
      expect(@rental.book).to eq @book
      expect(@rental.person).to eq @person
    end
  end
end
