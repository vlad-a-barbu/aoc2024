class Day4

  def initialize(path)
    @path = path
    @re = /XMAS/
  end

  def part1
    inputs.reduce(0) do |acc, lines|
      acc + lines.map { |x| x.scan(@re).length }.reduce(:+)
    end
  end

  def part2
  end

  def inputs
    inp = @lines ||= File.readlines(@path, chomp: true)
    rot = rotate(inp)
    diags = diagonals(inp)
    [inp, reverse(inp),
     rot, reverse(rot),
     diags[0], reverse(diags[0]),
     diags[1], reverse(diags[1])]
  end

  def rotate(lines)
    (0...lines[0].length).reduce([]) do |acc, j|
      acc << (0...lines.length).map { |i| lines[i][j] }.join
    end
  end

  def reverse(lines)
    lines.map { |x| x.reverse }
  end

  def diagonals(lines)
    rows = lines.length
    cols = lines[0].length

    tlbr = (0...rows).map do |i|
      (0...cols).map { |j| lines[i + j][j] if i + j < rows }.compact.join
    end + (1...cols).map do |j|
      (0...rows).map { |i| lines[i][j + i] if j + i < cols }.compact.join
    end

    trbl = (0...rows).map do |i|
      (0...cols).map { |j| lines[i + j][cols - 1 - j] if i + j < rows }.compact.join
    end + (1...cols).map do |j|
      (0...rows).map { |i| lines[i][cols - 1 - j - i] if cols - 1 - j - i >= 0 }.compact.join
    end

    [tlbr, trbl]
  end
  
end

d = Day4.new 'input.txt'
puts "part1: #{d.part1}"
puts "part2: #{d.part2}"
