module Serializers
  def serialize_people(allpeople)
    file = File.open('people.txt', 'w')
    allpeople.each do |person|
      file.write("#{JSON.generate(person)}\n")
    end
    file.close
  end
end
