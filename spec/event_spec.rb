require 'rspec'
require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Event do
  describe 'instantiation' do
    it 'exists' do
      craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      event = Event.new("Carla's Craft Connection", [craft], [person])
      expect(event).to be_a(Event)
    end

    it 'has attributes' do
      craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      event = Event.new("Carla's Craft Connection", [craft], [person])
      expect(event.name).to eq("Carla's Craft Connection")
      expect(event.crafts).to eq([craft])
      expect(event.attendees).to eq([person])
    end
  end

  describe 'methods' do
    before :each do
      @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      @event = Event.new("Carla's Craft Connection", [@sewing, @knitting], [@hector, @toni])
    end

    it 'returns attendee names' do
      expect(@event.attendee_names).to eq(["Hector", "Toni"])
    end

    it 'returns craft with greatest supply requirements' do
      expect(@event.craft_with_most_supplies).to eq('sewing')
    end

    it 'returns array with necessary supplies for event' do
      # require 'pry'; binding.pry
      expect(@event.supply_list).to eq(["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"])
    end
  end
end