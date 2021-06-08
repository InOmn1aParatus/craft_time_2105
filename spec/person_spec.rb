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
end