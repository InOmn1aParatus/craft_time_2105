require 'rspec'
require './lib/person'

RSpec.describe Person do
  describe 'instantiation' do
    it 'exists' do
      person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      expect(person).to be_a(Person)
    end

    it 'exists' do
      person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      expect(person.name).to eq('Hector')
      expect(person.interests).to eq(['sewing', 'millinery', 'drawing'])
      expect(person.supplies).to eq({})
    end
  end

  describe 'methods' do
    before :each do
      @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    end
    
    it 'adds supplies to person' do
      @person.add_supply('fabric', 4)
      @person.add_supply('scissors', 1)
      expect(@person.supplies).to eq({"fabric"=>4, "scissors"=>1})
    end

    it 'determines if person can craft' do
      expect(@hector.can_build?).to eq(false)
    end
  end
end