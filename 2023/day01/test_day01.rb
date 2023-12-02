# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'day01'

class Day01Test < Minitest::Test
  def setup
    input = <<~INPUT
1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet
    INPUT
    @day01 = Day01.new(input)
  end

  def test_solve1
    expected = 142
    assert_equal expected, @day01.solve1
  end

  def test_solve2
    expected = nil
    assert_equal expected, @day01.solve2
  end
end
