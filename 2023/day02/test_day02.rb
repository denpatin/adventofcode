# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'day02'

class Day02Test < Minitest::Test
  def setup
    input = <<~INPUT

    INPUT
    @day02 = Day02.new(input)
  end

  def test_solve1
    expected = nil
    assert_equal expected, @day02.solve1
  end

  def test_solve2
    expected = nil
    assert_equal expected, @day02.solve2
  end
end
