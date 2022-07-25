require_relative 'app'

def main
  app = App.new
  puts 'Welcome to the School Library!'
  command = app.action(true)
  app.run(command)
  puts ' '
  puts 'Leaving the school... Goodbye!'
end

main
