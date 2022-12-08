require "./day2"

lines = File.read_lines("data/day2.txt")
day2 = Day2.new(lines)
puts day2.score_part1
puts day2.score_part2
