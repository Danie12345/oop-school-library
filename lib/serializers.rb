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

  def all_serialize(allpeople, books)
    serialize_people(allpeople)
    serialize_books(books)
  end
end
