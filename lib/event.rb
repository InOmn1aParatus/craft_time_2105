# frozen_string_literal: true

class Event
  attr_reader :name, :crafts, :attendees

  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def attendee_names
    @attendees.map(&:name)
  end

  def craft_with_most_supplies
    @crafts.max_by do |craft|
      craft.supplies_required.count
    end.name
  end

  def supply_list
    # supplies = []
    # @crafts.each do |craft|
    #   craft.supplies_required.each do |type, _|
    #     supplies << type.to_s
    #   end
    # end
    # supplies.uniq
    @crafts.flat_map do |craft|
      craft.supplies_required.keys.map(&:to_s)
    end.uniq
  end

  def attendees_by_craft_interest
    interests = Hash.new([])
    @crafts.each do |craft|
      interests[craft.name] = @attendees.find_all do |attendee|
        attendee.interests.include?(craft.name)
      end
    end
    interests
  end

  def crafts_that_use(tool)
    @crafts.find_all do |craft|
      craft.supplies_required.keys.map(&:to_s).include?(tool)
    end
  end
end
