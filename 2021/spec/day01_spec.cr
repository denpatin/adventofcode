require "spec"
require "../src/day01"

describe Day01 do
  input = <<-INPUT
          199
          200
          208
          210
          200
          207
          240
          269
          260
          263
          INPUT
  seq = input.split "\n"

  describe "#part1" do
    it "returns number of measurements that are larger than the previous measurement" do
      Day01.new(seq).part1.should eq 7
    end
  end

  describe "#part2" do
    it "returns number of sums that are larger than the previous sum" do
      Day01.new(seq).part2.should eq 5
    end
  end
end
