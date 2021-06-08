require 'rspec'
require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Event do
  describe 'instantiation' do
    it 'exists' do
      event = Event.new("Carla's Craft Connection", [craft], [person])
      expect(event).to be_a(Event)
    end
  end
end