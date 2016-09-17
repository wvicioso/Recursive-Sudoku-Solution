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
board_string2 = "--5-3--819-285--6-6----4-5---74-283-34976---5--83--49-15--87--2-9----6---26-495-3"
board_string3 = "29-5----77-----4----4738-129-2--3-648---5--7-5---672--3-9--4--5----8-7---87--51-9"
board_string4 = "-8--2-----4-5--32--2-3-9-466---9---4---64-5-1134-5-7--36---4--24-723-6-----7--45-"
board_string5 = "6-873----2-----46-----6482--8---57-19--618--4-31----8-86-2---39-5----1--1--4562--"


board = Sudoku.new(board_string1)
board2 = Sudoku.new(board_string2)
board3 = Sudoku.new(board_string3)
board4 = Sudoku.new(board_string4)
board5 = Sudoku.new(board_string5)


board.solve
board2.solve
board3.solve
board4.solve
board5.solve

boards = [board, board2, board3, board4, board5]


boards.each do |board|
	if board.solved?
		puts "The board was solved!"
		puts board.pretty_board
	else
		p board.board
		puts "The board wasn't solved :("
	end
end
