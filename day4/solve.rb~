class Day3

  def initialize(path)
    @path = path
    @re = /(mul\((?<x>\d{1,3}),(?<y>\d{1,3})\))|(?<do>do\(\))|(?<dont>don\'t\(\))/
  end
  
  def part2
    mul = true
    input.scan(@re).reduce(0) do |acc, x|
      mul = true if !!x[2]
      mul = false if !!x[3]
      if mul && !!x[0] && !!x[1]
        nums = x[0..1].map { |y| y.to_i }
        acc += nums[0] * nums[1]
      end
      acc
    end
  end
  
  def part1
    input.scan(@re).reduce(0) do |acc, x|
      nums = x[0..1].map { |y| y.to_i }
      acc + nums[0] * nums[1]
    end
  end

  def input
    @input ||= File.read(@path)
  end
  
end 

d = Day3.new 'input.txt'
puts "part1: #{d.part1}"
puts "part2: #{d.part2}"

