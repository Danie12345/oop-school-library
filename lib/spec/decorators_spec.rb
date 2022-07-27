require_relative '../person'
require_relative '../capitalize_decorator'
require_relative '../trim_decorator'

describe 'Decorators for person name' do
  context 'When capitalizing person name' do
    before(:each) do
      @person = Person.new(22, 'maximilianus')
    end

    it 'should capitalize the name attribute' do
      capitalized_person = CapitalizeDecorator.new(@person)
      expect(capitalized_person.correct_name).to eq 'Maximilianus'
    end

    it 'should trim the name attribute' do
      trimmed_person = TrimDecorator.new(@person)
      expect(trimmed_person.correct_name).to eq 'Maximilian'
    end
  end
end
