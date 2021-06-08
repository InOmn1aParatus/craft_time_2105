require 'rspec'
require './lib/person'
require './lib/craft'

RSpec.describe Craft do
  describe "instantiation" do
    it 'exists' do
      craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      expect(craft).to be_a(Craft)
    end
  end
end