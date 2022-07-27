require_relative '../student'
require_relative '../classroom'

describe Classroom do
  context 'When creating a new classroom object' do
    before(:each) do
      label = 'Class C'
      @classroom = Classroom.new(label)
    end
    it 'should contain a label and empty students array' do
      expect(@classroom.label).to eq 'Class C'
      expect(@classroom.students).to match_array([])
    end

    it 'should be able to add a student to the classroom' do
      student = Student.new(@classroom, 12, 'Jake', 'ec9258f5-7b9f-4fd5-976a-d40ec7ddca09')
      expect(@classroom.students).to match_array([])
      @classroom.add_student(student)
      expect(student.classroom).to eq @classroom
    end
  end
end
