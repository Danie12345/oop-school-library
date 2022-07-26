module Serializers
  def serialize_people(allpeople)
    file = File.open('people.json', 'w')
    newarray = []
    allpeople.each do |person|
      newarray.push(JSON.generate(person).to_s)
    end
    file.write(newarray)
    file.close
  end

  def serialize_books(books)
    file = File.open('books.json', 'w')
    newarray = []
    books.each do |book|
      newarray.push(JSON.generate(book).to_s)
    end
    file.write(newarray)
    file.close
  end

  def serialize_rentals(rentals)
    file = File.open('rentals.json', 'w')
    newarray = []
    rentals.each do |rental|
      newarray.push(JSON.generate(rental).to_s)
    end
    file.write(newarray)
    file.close
  end

  def serialize_all(allpeople, books, rentals)
    serialize_people(allpeople)
    serialize_books(books)
    serialize_rentals(rentals)
  end
end
