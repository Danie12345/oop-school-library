require_relative '../student'
require_relative '../classroom'

describe Student do
  context 'When creating a new student object' do
    before(:each) do
      name = 'daniel'
      age = 30
      id = 'ec9258f5-7b9f-4fd5-976a-d40ec7ddca09'
      classroom = Classroom.new('class B')
      @student = Student.new(classroom, age, name, id, parent_permission: false)
    end
    it 'should contain a age, name, parent permission and description' do
      expect(@student.id).to be_truthy
      expect(@student.parent_permission).to be_falsey
      expect(@student.name).to eq 'daniel'
      expect(@student.age).to eq 30
      expect(@student.rentals).to match_array([])
      expect(@student.description).to eq "[Student] Daniel is 30 years old, they don't have their parent's "\ 
                                         'permission and has an id ec9258f5-7b9f-4fd5-976a-d40ec7ddca09.'
    end
    it 'should capitalize the name' do
      expect(@student.correct_name).to eq 'Daniel'
    end
  end
end
