class Day08
  getter displays : Array(Array(Array(String)))

  def initialize(input)
    @displays = input.map &.split("|").map(&.split)
  end

  def part1
    result = 0

    displays.each do |display|
      _, output = display
      result += output.count &.size.in?(2, 4, 3, 7)
    end

    result
  end

  def part2
    result = 0

    displays.each do |display|
      input, output = display
      pattern = dictionary.chars.each_permutation.map(&.join).find do |p|
        input.all? { |i| reference.keys.includes? i.tr(dictionary, p).chars.sort!.join }
      end
      result += output.map { |o| reference[o.tr(dictionary, pattern.not_nil!).chars.sort!.join] }.join.to_i
    end

    result
  end

  private def dictionary
    "abcdefg"
  end

  private def reference
    {
      "abcefg"  => 0,
      "cf"      => 1,
      "acdeg"   => 2,
      "acdfg"   => 3,
      "bcdf"    => 4,
      "abdfg"   => 5,
      "abdefg"  => 6,
      "acf"     => 7,
      "abcdefg" => 8,
      "abcdfg"  => 9
    }
  end
end
