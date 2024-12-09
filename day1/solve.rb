class Day1

  def initialize(path)
    @path = path
  end
  
  def part2
    nums[0].reduce(0) do |acc, x|
      n = nums[1].find_all { |y| x == y } .length
      acc + x * n
    end
  end
  
  def part1
    nums[0].sort
      .zip(nums[1].sort)
      .reduce(0) { |acc, nums| acc + (nums[0] - nums[1]).abs }
  end
  
  def nums
    raise 'invalid path' unless @path && File.exist?(@path)
    @nums ||= File.foreach(@path).reduce([[], []]) do |acc, line|
      nums = line.split(' ').map { |x| x.to_i }
      [ acc[0] << nums[0], acc[1] << nums[1] ]
    end
  end
  
end 

d = Day1.new 'input.txt'
puts "part1: #{d.part1}"
puts "part2: #{d.part2}"

