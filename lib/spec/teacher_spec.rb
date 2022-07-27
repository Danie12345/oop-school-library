require_relative '../teacher'

describe Teacher do
  context 'When creating a new student object' do
    before(:each) do
      name = 'alex'
      age = 300
      id = 'ec9258f5-7b9f-4fd5-976a-d40ec7ddca09'
      specialization = 'maths'
      @teacher = Teacher.new(age, name, specialization, id)
    end
    it 'should contain a age, name, specialization and description' do
      expect(@teacher.id).to be_truthy
      expect(@teacher.specialization).to eq 'maths'
      expect(@teacher.name).to eq 'alex'
      expect(@teacher.age).to eq 300
      expect(@teacher.rentals).to match_array([])
      expect(@teacher.description).to eq '[Teacher] Alex is 300 years old, specialized in maths '\ 
                                         'and has an id ec9258f5-7b9f-4fd5-976a-d40ec7ddca09.'
    end
    it 'should capitalize the name' do
      expect(@teacher.correct_name).to eq 'Alex'
    end
  end
end
