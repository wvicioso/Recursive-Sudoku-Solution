require_relative 'sudoku'

# The sudoku puzzles that your program will solve can be found
# in the sudoku_puzzles.txt file.
#
# Currently, Line 18 defines the variable board_string to equal
# the first puzzle (i.e., the first line in the .txt file).
# After your program can solve this first puzzle, edit
# the code below, so that the program tries to solve
# all of the puzzles.
#
# Remember, the file has newline characters at the end of each line,
# so we call String#chomp to remove them.

File.readlines('sudoku_puzzles.txt').each_with_index do |line, index|
board_string = line.chomp


board = Sudoku.new(board_string)

 10.times do 
  board.solve
  end
  if board.solved?

    puts "\nBoard number - #{index + 1} was solved!\n\n"
    print board.pretty_board
  else
    puts "\nBoard number - #{index + 1} wasn't solved :( \n\n"
  end

end
