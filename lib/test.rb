require_relative 'person'
require_relative 'capitalize_decorator'
require_relative 'trim_decorator'

person = Person.new(22, 'maximilianus')
puts person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
