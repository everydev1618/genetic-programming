Let’s say that we have a table of outputs for an unknown function, and we want to find out what that function is.
One possible method of finding a solution is to use genetic programming. In genetic programming we begin with a random population of programs, then rank them according to how well they meet the solution criteria. The top ranked programs are then modified to create a new generation of programs. The new generation is ranked by how well the solve the problem in the same way and the process repeats until, hopefully, we’ll have evolved a strong solution.

The modifications made to the programs are based on techniques observed in biological evolution: mutation and crossover.

In mutation a piece of one program is altered randomly, for example ```x + 3``` could become ```x + (y - 1)```. The mutation occurs at one node in the parse tree and replaces it with a new randomly generated node.

Crossover works in much the same way, except instead of randomly altering the node it is taken from another node of another program. For example:
```x + (y * x)```  crossed with ```3 - (y + x*x)``` could yield something like ```(y*x) - (y + x*x)```.

**Challenge** : Given a set of test data (`data.csv`) determine the function that
matches that data through genetic programming.

In this repo you will find three other files:

- data.csv is a CSV where each row is: x, y, result
- fitness.rb is a helper function for determing the fitness of a given object that responds
  to `calculate(x,y)` and returns a result. A lower score from this function is
  better, 0 indicates a match.
- example.rb shows a niave usage of fitness.rb and loads up the test data for
  you

Bonus points:

- Create a visualization for the 'evolution' of the program


Adapted from Ruby Quiz 212, please don't look at the solution.

