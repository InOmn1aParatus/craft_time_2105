require 'rspec'
require './lib/person'

RSpec.describe Person do
  describe 'instantiation' do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    expect(person).to be_a(Person)
  end
end