require_relative 'fitness'
require 'csv'

class Dumb
  def self.calculate(x, y)
    x + y
  end
end

data = CSV.read('data.csv').map { |row| row.map { |c| c.to_i } }
delta = fitness(Dumb, data)

puts "The delta of the dumb object is: #{delta} . Lower is beter, 0 is perfect."
