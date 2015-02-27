require_relative 'fitness'
require 'csv'

code = "class Dumb
  def self.calculate(x, y)
    x + y
  end
end"
eval(code)

start = 'x + y'
data = CSV.read('data.csv').map { |row| row.map { |c| c.to_i } }
$operators = ['*', '/', '-', '+']
$variables = ['x' , 'y']

def put_delta(delta)
  puts "The delta of the dumb object is: #{delta} . Lower is beter, 0 is perfect."
end

def mutate_add(current_gene)
  operator = $operators[rand(3)]
  variable = $variables[rand(1)]
  number = rand(1..9)
  if (rand(100) % 2 == 0)
    gene = " #{operator} #{number}"
  else
    gene = " #{operator} #{variable}"
  end
  current_gene + gene
end

def mutate_operators(current_gene)
  current_gene.gsub($operators.sample, $operators.sample)
end

def mutate_delete(current_gene)
  rand(1.9).times do
    current_gene.sub!(/[+\-*\/] [\dxy]/, '')
  end
  current_gene
end

def mutate(code, current_gene, data)
  mutation_type = rand(2)
  case rand(0..2)
  when 0
    new_gene = mutate_operators(current_gene)
  when 1
    new_gene = mutate_add(current_gene)
  when 2
    new_gene = mutate_delete(current_gene)
  end
  new_code = code.gsub(current_gene, new_gene)
  begin
    eval(new_code)
    delta = fitness(Dumb, data)
    [delta, new_gene, new_code]
  rescue
    eval(code)
    delta = fitness(Dumb, data)
    [delta, current_gene, code]
  end
end

def generation(last_three, data)
  variants = []
  3.times do
    last_three.each do |delta, gene, code|
      variants.push(mutate(code, gene, data))
    end
  end
  variants += last_three
  variants.sort_by! { |row| row[0] }
end

eval(code)
delta =fitness(Dumb, data)
first_three = 3.times.map { [delta, 'x + y', code] }
variants = generation(first_three, data)

400.times do |i|
  puts "Generation #{i}: "
  variants.first(3).each { |row| puts "#{row[1]} #{row[0]}"}
  variants = generation(variants.first(3), data)
end

#variants.each { |row| puts "gene: #{row[1]} delta: #{row[0]}"}

#puts variations.reduce("") { |out, row| out + row[0].to_s }


#puts variations.reduce("") { |out, row| out + row[0].to_s }


