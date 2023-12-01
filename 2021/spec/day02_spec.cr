require "spec"
require "../src/day02"

describe Day02 do
  input = <<-INPUT
          forward 5
          down 5
          forward 8
          up 3
          down 8
          forward 2
          INPUT
  instrs = input.split "\n"

  describe "#part1" do
    it "returns the product of the final horizontal and final depth positions" do
      Day02.new(instrs).part1.should eq 150
    end
  end

  describe "#part2" do
    it "returns the product of the final horizontal and final depth positions taking aim into account" do
      Day02.new(instrs).part2.should eq 900
    end
  end
end
