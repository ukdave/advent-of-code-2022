require "./day4"

lines = File.read_lines("data/day4.txt")
day4 = Day4.new(lines)
puts day4.num_full_overlaps
puts day4.num_partial_overlaps
