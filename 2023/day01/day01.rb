# frozen_string_literal: true

class Day01
  def initialize(input)
    @input = input.split("\n")
  end

  def solve1
    @input.sum { |line| number_from(line) }
  end

  def solve2
    @input.sum { |line| number_from(convert_to_digits(line)) }
  end

  private

  WORDS = %w[one two three four five six seven eight nine].freeze
  DIGITS = WORDS.each_with_index.to_h { |w, i| [w, i + 1] }
  DIGITS_REV = DIGITS.transform_keys(&:reverse)

  def number_from(str)
    digits = str.scan(/\d/)
    "#{digits.first}#{digits.last}".to_i
  end

  def convert_to_digits(str)
    pattern_beg = Regexp.union(DIGITS.keys)
    pattern_end = Regexp.union(DIGITS_REV.keys)
    str_beg = str.gsub(pattern_beg, DIGITS)
    str_end = str.reverse.gsub(pattern_end, DIGITS_REV).reverse
    str_beg + str_end
  end
end
