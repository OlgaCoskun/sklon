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

  describe '#set_names' do
    it 'should return genitive first_name' do
      expect(person.set_names.genitive_fname).to eq "Ольги"
    end
    it 'should return genitive last_name' do
      expect(person.set_names.genitive_lname).to eq "Виноградовой"
    end
    it 'should return genitive middle_name' do
      expect(person.set_names.genitive_mname).to eq "Александровны"
    end

    it 'should return dative first_name' do
      expect(person.set_names.dative_fname).to eq "Ольге"
    end
    it 'should return dative last_name' do
      expect(person.set_names.dative_lname).to eq "Виноградовой"
    end
    it 'should return dative middle_name' do
      expect(person.set_names.dative_mname).to eq "Александровне"
    end

    it 'should return accusative first_name' do
      expect(person.set_names.accusative_fname).to eq "Ольгу"
    end
    it 'should return accusative last_name' do
      expect(person.set_names.accusative_lname).to eq "Виноградову"
    end
    it 'should return accusative middle_name' do
      expect(person.set_names.accusative_mname).to eq "Александровну"
    end

    it 'should return instrumental first_name' do
      expect(person.set_names.instrumental_fname).to eq "Ольгой"
    end
    it 'should return instrumental last_name' do
      expect(person.set_names.instrumental_lname).to eq "Виноградовой"
    end
    it 'should return instrumental middle_name' do
      expect(person.set_names.instrumental_mname).to eq "Александровной"
    end

    it 'should return prepositional first_name' do
      expect(person.set_names.prepositional_fname).to eq "Ольге"
    end
    it 'should return prepositional last_name' do
      expect(person.set_names.prepositional_lname).to eq "Виноградовой"
    end
    it 'should return prepositional middle_name' do
      expect(person.set_names.prepositional_mname).to eq "Александровне"
    end
  end
end
