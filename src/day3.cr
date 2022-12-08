class Day3
  PRIORITIES = ('a'..'z').to_a + ('A'..'Z').to_a

  @rucksack_compartments : Array(Array(String))

  def initialize(lines : Array(String))
    @rucksack_compartments = lines.map { |line| split_string(line) }
  end

  def sum_priorities
    @rucksack_compartments.sum do |(c1, c2)|
      PRIORITIES.index!(common_item(c1, c2)) + 1
    end
  end

  private def common_item(compartment1, compartment2)
    (compartment1.chars & compartment2.chars).first
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
