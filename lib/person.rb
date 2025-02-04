# frozen_string_literal: true

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

  def can_build?(craft)
    craft.supplies_required.all? do |type, quantity|
      @supplies[type.to_s] >= quantity
    end
  end
end
