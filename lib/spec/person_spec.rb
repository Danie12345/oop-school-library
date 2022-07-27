require_relative '../person'

describe Person do
  context 'When creating a new person object' do
    before(:each) do
      name = 'axel'
      age = 18
      id = 'ec9258f5-7b9f-4fd5-976a-d40ec7ddca09'
      @person = Person.new(age, name, id)
    end
    it 'should contain a age, name, parent permission and description' do
      expect(@person.id).to be_truthy
      expect(@person.parent_permission).to be_truthy
      expect(@person.name).to eq 'axel'
      expect(@person.age).to eq 18
      expect(@person.rentals).to match_array([])
      expect(@person.description).to eq '[Person] axel is 18 years old and '\ 
                                        'has an id ec9258f5-7b9f-4fd5-976a-d40ec7ddca09.'
    end
    it 'should capitalize the name' do
      expect(@person.correct_name).to eq 'Axel'
    end
  end
end
