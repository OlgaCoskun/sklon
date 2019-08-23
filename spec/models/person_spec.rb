require 'rails_helper'

RSpec.describe Person, type: :model do
  let(:person) { Person.new(first_name: 'Ольга', last_name: 'Виноградова', middle_name: 'Александровна')}

  context 'validation check' do
    it { should validate_presence_of :first_name }
  end

  context 'check full_name' do
    it 'should return full_name' do
      expect(person.create_full_name).to eq 'Виноградова Ольга Александровна'
    end
  end
end
