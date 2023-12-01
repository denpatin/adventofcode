# frozen_string_literal: true

# This script creates a directory and two files for each new day of Advent of Code.
# The directory is named dayXX, where XX is the day number.
# The first file is named dayXX.rb and contains a skeleton for the solution.
# The second file is named test_dayXX.rb and contains a skeleton for the tests.
# The script requires strictly one argument — number between 1 and 25.
#
# Example: ruby prepare.rb 1
# The script will create the following files:
# - day01/day01.rb
# - day01/test_day01.rb

unless ARGV.length == 1
  puts 'This script requires exactly one argument — the number of the challenge day.'
  exit
end

day_number = ARGV[0].to_i
if day_number < 1 || day_number > 25
  puts 'Day number must be a number between 1 and 25.'
  exit
end

formatted_day = format('%02d', day_number)

# Create dayXX directory
dir_name = "day#{formatted_day}"
Dir.mkdir(dir_name) unless Dir.exist?(dir_name)

# Create dayXX.rb file
File.open("#{dir_name}/day#{formatted_day}.rb", 'w') do |file|
  file.puts <<~DAY_RB
    # frozen_string_literal: true

    class Day#{formatted_day}
      def initialize(input)
        @input = input
      end

      def solve1
      end

      def solve2
      end
    end
  DAY_RB
end

# Create test_dayXX.rb file
File.open("#{dir_name}/test_day#{formatted_day}.rb", 'w') do |file|
  file.puts <<~TEST_DAY_RB
    # frozen_string_literal: true

    require 'minitest/autorun'
    require_relative 'day#{formatted_day}'

    class Day#{formatted_day}Test < Minitest::Test
      def setup
        input = <<~INPUT

        INPUT
        @day#{formatted_day} = Day#{formatted_day}.new(input)
      end

      def test_solve1
        expected = 1
        assert_equal expected, @day#{formatted_day}.solve1
      end

      def test_solve2
        expected = 2
        assert_equal expected, @day#{formatted_day}.solve2
      end
    end
  TEST_DAY_RB
end
