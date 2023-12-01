require "./day01"
require "./day02"

puts "Day 1:"
input = File.read_lines("#{__DIR__}/day01.txt")
day01 = Day01.new(input)
puts day01.part1
puts day01.part2
puts
puts "Day 2:"
input = File.read_lines("#{__DIR__}/day02.txt")
day02 = Day02.new(input)
puts day02.part1
puts day02.part2
