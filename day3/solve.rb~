class Day2

  def initialize(path)
    @path = path
  end
  
  def part2
    nums.count { |x| safe_dampener(x) }
  end
  
  def part1
    nums.count { |x| safe(x) }
  end

  def safe(row)
    return true if row.length <= 1 
    asc = nil
    prev = row[0]
    for x in row[1..]
      diff = x - prev
      return false if !diff.abs.between?(1, 3)
      if diff != 0
        ord = diff > 0
        asc = ord if asc.nil?
        return false if asc != ord
      end
      prev = x
    end
    return true
  end
  
  def safe_dampener(row)
    for x in 0...row.length
      return true if safe(row.reject.with_index { |_, i| i == x })
    end
    return false
  end
  
  def nums
    raise 'invalid path' unless @path && File.exist?(@path)
    @nums ||= File.foreach(@path).reduce([]) do |acc, line|
      acc << line.split(' ').map { |x| x.to_i }
    end
  end
  
end 

d = Day2.new 'input.txt'
puts "part1: #{d.part1}"
puts "part2: #{d.part2}"

