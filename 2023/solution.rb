# frozen_string_literal: true

# This is a script to run the solutions for each day.
# It can be run with `ruby solution.rb [day number] [input file or link (optional)]`.
# If no input file is provided, it will look for a file named `input` in the directory for the day.
# If the unput file is provided, it will look for a file in the current directory.
# It is assumed that the input file is a text file.
# If the input file is a link, it will download the file from the link.
# Links must end with `/input` to be considered valid.
# It is assumed that the link is taken from the Advent of Code website.

require 'net/http'

class WrongArgumentException < StandardError; end
class WrongInputFileException < StandardError; end
class FileNotFoundException < StandardError; end

begin
  raise WrongArgumentException unless [1, 2].include?(ARGV.size)

  day_number, input_file = ARGV
  day_number = format('%02d', day_number)

  require_relative "day#{day_number}/day#{day_number}"
  class_name = "Day#{day_number}"
  day_class = Object.const_get(class_name)

  input = nil
  if input_file.nil?
    script_dir = File.dirname(__FILE__)
    input_file = File.join(script_dir, "day#{day_number}", 'input')
  end

  if input_file =~ URI::DEFAULT_PARSER.make_regexp
    begin
      raise WrongInputFileException unless input_file.end_with?('/input')

      uri = URI.parse(input_file)
      response = Net::HTTP.get_response(uri)
      raise FileNotFoundException if response.is_a?(Net::HTTPNotFound)

      input = response.body
    end
  else
    raise FileNotFoundException unless File.exist?(input_file)

    input = File.read(input_file)
  end

  day_instance = day_class.new(input)

  puts "Solution 1: #{day_instance.solve1}"
  puts "Solution 2: #{day_instance.solve2}"
rescue WrongArgumentException
  puts 'Usage: ruby solution.rb [day number] [input file or link (optional)]'
rescue WrongInputFileException
  puts "Input file `#{input_file}` is not an input file."
rescue FileNotFoundException
  puts "Input file `#{input_file}` not found."
rescue LoadError
  puts "File `day#{day_number}.rb` not found. Ensure it is in the `day#{day_number}` directory."
rescue NameError
  puts "Day class `#{class_name}` not found. Ensure the class is defined in `day#{day_number}.rb`."
rescue StandardError => e
  puts e.message
end
