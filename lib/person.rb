class Person
  attr_reader :name, :interests, :supplies

  def initialize(info)
    @name = info[:name]
    @interests = info[:interests]
    @supplies = Hash.new(0)
  end

  def add_supply(supply, quantity)
    @supplies[supply] += quantity
  end

  def supplies_to_symbols
    @supplies.keys.map do |key|
      key.to_sym
    end.sort
  end

  def value_comparison(craft)
    craft.supplies_required.values.
  end

  def can_build?(craft)
    tools = craft.supplies_required.keys.sort
    (supplies_to_symbols == tools) && 
    end
  end
end