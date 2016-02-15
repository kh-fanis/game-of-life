# game-of-life

Rights of this game are:
 * Any live cell with fewer than two live neighbours dies, as if caused by under-population.
 * Any live cell with two or three live neighbours lives on to the next generation.
 * Any live cell with more than three live neighbours dies, as if by over-population.
 * Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

# Staring game!

To start you need Ruby installed on your system!

Open folder where game locates and write 'ruby run.rb', which is gonna launch game.
After it's awaiting for the game file. There are several examples in examples folder. To test the game use examples. Just type 'examples/example_one.txt' or 'examples/example_two.txt' or 'examples/example_three.txt' or You can create yourself.

# Play Files

Dead cells should be empty ' ' and alive cells to be star '*'.

To test application, there are tests in spec folder, to test them first of all write 'bundle install' on the folder of the game, which goes to install last version of Rspec and type 'rspec spec' to see results.

# Versionos:

Ruby version 2.2.4
Last version of RSpec
