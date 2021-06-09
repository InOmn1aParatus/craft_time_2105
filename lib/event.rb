class Event
  attr_reader :name, :crafts, :attendees

  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def attendee_names
    @attendees.map do |attendee|
      attendee.name
    end
  end

  def craft_with_most_supplies
    @crafts.max_by do |craft|
      craft.supplies_required.count
    end.name
  end

  def supply_list
    # list = []
    # @crafts.each do |craft|
    #   craft.supplies_required.keys.each do |key|
    #     list << key.to_s
    #   end
    # end
    # list.uniq
    supplies = []
    @crafts.each do |craft|
      craft.supplies_required.each do |type, _|
        # The above method is preferable because it performs fewer iterations
        supplies << type.to_s
      end
    end
    supplies.uniq
  end
end