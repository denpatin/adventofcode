class Day01
  getter seq : Array(Int32)

  def initialize(input)
    @seq = input.map(&.to_i)
  end

  def part1
    cnt = 0
    seq.each_cons(2) { |p| cnt += 1 if p[1] > p[0] }
    cnt
  end

  def part2
    cnt = 0
    seq.each_cons(3).map(&.sum).each_cons(2) { |p| cnt += 1 if p[1] > p[0] }
    cnt
  end
end
