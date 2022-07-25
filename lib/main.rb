require_relative 'app'

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

def cases(app, command)
  case command
  when '1'
    app.list_books
  when '2'
    app.list_people
  when '3'
    app.create_person
  when '4'
    app.create_book
  when '5'
    app.create_rental
  when '6'
    app.rentals_by_index
  end
end

def action(app, first)
  command = call_input(first)
  cases(app, command)
  return command
end

def run(app)
  puts 'Welcome to the School Library!'
  command = action(app, true)
  while command != '7'
    puts ' '
    command = action(app, false)
  end
  puts ' '
  puts 'Leaving the school... Goodbye!'
end

def main
  run(App.new)
end

main
