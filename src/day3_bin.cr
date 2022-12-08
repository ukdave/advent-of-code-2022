require "./day3"

lines = File.read_lines("data/day3.txt")
day3 = Day3.new(lines)
puts day3.sum_priorities
