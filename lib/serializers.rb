module Serializers
  def serialize_people(allpeople)
    file = File.open('people.txt', 'w')
    allpeople.each do |person|
      file.write("#{JSON.generate(person)}\n")
    end
    file.close
  end

  def serialize_books(books)
    file = File.open('books.txt', 'w')
    books.each do |book|
      file.write("#{JSON.generate(book)}\n")
    end
    file.close
  end

  def all_serialize(allpeople, books)
    serialize_people(allpeople)
    serialize_books(books)
  end
end
