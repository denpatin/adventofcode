file = File.read("input")

p file.chomp.split("\n\n").map { |c| c.split.map(&.to_i).sum }.max
p file.chomp.split("\n\n").map { |c| c.split.map(&.to_i).sum }.sort.last(3).sum
