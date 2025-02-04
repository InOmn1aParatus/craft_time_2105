# frozen_string_literal: true

require 'rspec'
require './lib/person'
require './lib/craft'

RSpec.describe Person do
  describe 'instantiation' do
    it 'exists' do
      person = Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] })
      expect(person).to be_a(Person)
    end

    it 'exists' do
      person = Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] })
      expect(person.name).to eq('Hector')
      expect(person.interests).to eq(%w[sewing millinery drawing])
      expect(person.supplies).to eq({})
    end
  end

  describe 'methods' do
    before :each do
      @person = Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] })
    end

    it 'adds supplies to person' do
      @person.add_supply('fabric', 4)
      @person.add_supply('scissors', 1)
      expect(@person.supplies).to eq({ 'fabric' => 4, 'scissors' => 1 })
    end

    it 'determines if person can craft' do
      hector = Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] })
      sewing = Craft.new('sewing', { fabric: 5, scissors: 1, thread: 1, sewing_needles: 1 })
      expect(hector.can_build?(sewing)).to eq(false)

      hector.add_supply('fabric', 7)
      hector.add_supply('thread', 1)
      expect(hector.can_build?(sewing)).to eq(false)

      hector.add_supply('scissors', 1)
      hector.add_supply('sewing_needles', 1)
      expect(hector.can_build?(sewing)).to eq(true)
    end
  end
end
