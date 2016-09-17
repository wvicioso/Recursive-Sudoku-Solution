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

board_string1 = File.readlines('sudoku_puzzles.txt').first.chomp


board = Sudoku.new(board_string1)



board.solve

	if board.solved?
		puts "The board was solved!"
		puts board.pretty_board
	else
		p board.board
		puts "The board wasn't solved :("
	end



