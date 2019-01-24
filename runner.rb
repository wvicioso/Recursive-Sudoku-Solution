require_relative 'sudoku'

# The sudoku puzzles can be found in the sudoku_puzzles.txt file.

puzzles = File.readlines('sudoku_puzzles.txt').join.split(' ')

#### TEST ALL PUZZLES ####

# solutions = []
# puzzles.map { |e|
#   board = Sudoku.new(e)
#   if board
#     solutions.push(board)
#     puts "The board was solved!"
#     board.pretty_board
#   else
#     puts "The board wasn't solved :("
#   end
# }
# puts solutions

#### TEST INDIVIDUAL PUZZLES ####

board = Sudoku.new(puzzles[0])
if board
  puts "The board was solved!"
  board.pretty_board
else
  puts "The board wasn't solved :("
end
