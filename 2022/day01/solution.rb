file = File.read('input')

p file.chomp.split("\n\n").map { |c| c.split.map(&:to_i).sum }.max
p file.chomp.split("\n\n").map { |c| c.split.map(&:to_i).sum }.max(3).sum
