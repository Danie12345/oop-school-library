require_relative 'person'

class Teacher < Person
  attr_reader :specialization

  def initialize(age, name, specialization = '', id = SecureRandom.uuid)
    super(age, name, id)
    @specialization = specialization
  end

  def description(index = 0, index_b: false)
    "#{"#{index}) " if index_b}[#{self.class}] #{correct_name} is #{@age} " \
      "years old, specialized in #{@specialization} and has an id #{@id}."
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'props' => [@id, @age, @name, @specialization]
    }.to_json(*args)
  end
end
