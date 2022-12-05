require "./day1"

lines = File.read_lines("src/day1.txt")
day1 = Day1.new(lines)
puts day1.max_calories
