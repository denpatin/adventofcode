class Day02
  getter instrs : Array(String)

  def initialize(@instrs); end

  def part1
    horizontal, depth = 0, 0

    instrs.map(&.split " ").each do |instr|
      case instr[0]
      when "forward" then horizontal += instr[1].to_i
      when "down"    then depth += instr[1].to_i
      when "up"      then depth -= instr[1].to_i
      end
    end

    horizontal * depth
  end

  def part2
    horizontal, depth, aim = 0, 0, 0

    instrs.map(&.split " ").each do |instr|
      case instr[0]
      when "forward"
        horizontal += instr[1].to_i
        depth += aim * instr[1].to_i
      when "down"
        aim += instr[1].to_i
      when "up"
        aim -= instr[1].to_i
      end
    end

    horizontal * depth
  end
end
