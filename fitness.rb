def fitness(program, data)
  data.reduce(0) do |delta, row|
    x, y, result = row
    value = program.calculate(x, y)
    delta + (value - result).abs
  end
end
