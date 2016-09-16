class Sudoku
  attr_accessor :board



  def initialize(board_string)
    @board = get_board(board_string)
  end

  # Takes a board as a string in the format
  # you see in the puzzle file. Returns
  # something representing a board after
  # your solver has tried to solve it.
  # How you represent your board is up to you!
  def solve(board_string)
    get_board(board_string)
  end

  # Returns a boolean indicating whether
  # or not the provided board is solved.
  # The input board will be in whatever
  # form `solve` returns.
  def solved?(board)
  end

  def get_board(board_string)
    board_string.chars.each_slice(9).to_a
  end

  def get_cols(index)
    board.transpose[index]
  end

  def get_row(index)
    board[index]
  end

  def get_box
  end 
  # Takes in a board in some form and
  # returns a _String_ that's well formatted
  # for output to the screen. No `puts` here!
  # The input board will be in whatever
  # form `solve` returns.
  def pretty_board(board)
  end
end