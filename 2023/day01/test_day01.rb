# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'day01'

class Day01Test < Minitest::Test
  INPUT1 = <<~INPUT
    1abc2
    pqr3stu8vwx
    a1b2c3d4e5f
    treb7uchet
  INPUT

  INPUT2 = <<~INPUT
    two1nine
    eightwothree
    abcone2threexyz
    xtwone3four
    4nineeightseven2
    zoneight234
    7pqrstsixteen
    ninesixmlfjxhscninehqcdvxf8nzfivetwonehhd
    4seven2psg8hqg9oneightnzc
    zfourvxngsmmqsldpkrrbfnjf2mvkdhfs7eightwotc
    2rzvpfpgzxk3863eightoneighttbb
  INPUT

  def setup
    @day011 = Day01.new(INPUT1)
    @day012 = Day01.new(INPUT2)
  end

  def test_solve1
    expected = 142
    assert_equal expected, @day011.solve1
  end

  def test_solve2
    expected = 490
    assert_equal expected, @day012.solve2
  end
end
