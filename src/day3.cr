class Day3
  PRIORITIES = ('a'..'z').to_a + ('A'..'Z').to_a

  @rucksacks : Array(String)

  def initialize(lines : Array(String))
    @rucksacks = lines
  end

  def sum_priorities_rucksack_compartment_common_item
    @rucksacks.sum do |rucksack|
      compartments = split_string(rucksack)
      common_item = find_common_item(compartments)
      PRIORITIES.index!(common_item) + 1
    end
  end

  def sum_priorities_group_common_item
    @rucksacks.each_slice(3, true).sum do |group|
      common_item = find_common_item(group)
      PRIORITIES.index!(common_item) + 1
    end
  end

  private def find_common_item(compartments)
    compartment_items = compartments.map(&.chars)
    compartment_items.first.find { |item| compartment_items[1..].all?(&.includes?(item)) }
  end

  private def split_string(str)
    midpoint = (str.size / 2).to_i
    if str.size.odd?
      first_half = str[0, midpoint + 1]
      second_half = str[midpoint + 1, midpoint]
    else
      first_half = str[0, midpoint]
      second_half = str[midpoint, midpoint]
    end
    [first_half, second_half]
  end
end
