require 'pry'

class Sudoku
  attr_accessor :board
  # :board_array
  attr_reader :possibles

      STARTING_POINTS = {
      [0,0] => {0=>0},
      [0,1] => {1=>3},
      [0,2] => {2=>6},
      [1,0] => {3=>27},
      [1,1] => {4=>30},
      [1,2] => {5=>33},
      [2,0] => {6=>54},
      [2,1] => {7=>57},
      [2,2] => {8=>60}
    }
 

  def initialize(board_string)
    @board = board_string
    # @board_array = board_to_array(board_string)
    @possibles = '123456789'
  end

  def solve
    until solved?
      board.split('').each_with_index do |element, idx|

        if element == '-'
          possible_nums = current_possibles(idx)
          update_board(idx, possible_nums) if single_solution?(possible_nums)
        end
      end
      self.pretty_board
      solve
    end
  end

  def solved?
    return true unless board.include?('-')
    false

    # if board.split('').reduce(:+) == 405
    #   true
    # end
  end

  def board_to_array(board_string)
    board_string.chars.each_slice(9).to_a
  end




  def find_super_box_index(value_index)
    # box_num = value_index % 27 
    # relative_col = col_num % 3 
    # rel_row = row_num % 3 

    box_row = value_index / 27
    box_col = value_index / 3 % 3
    STARTING_POINTS[[box_row,box_col]].values.first
  end 


  def get_box(box_start)
    x = box_start
    super_box = ''
    3.times do
        super_box += board[x..x+2]
        x += 9
    end
    super_box
  end 

  def get_cols(idx)
    col_num = idx % 9
    board_to_array(board).transpose[col_num].join
  end 
 
  def get_rows(idx)
    row_num = idx / 9 
    board_to_array(board)[row_num].join
  end



  def current_possibles(idx)
    box = get_box(find_super_box_index(idx))
    row = get_rows(idx)
    col = get_cols(idx)
    delete_these = box + row + col

    possibles.delete delete_these.delete("-")
  end

  def single_solution?(possible_nums)
    possible_nums.length == 1
  end

  def update_board(idx, possible_nums)
      @board[idx] = possible_nums[0].to_s
  end


  def pretty_board
    board_array = []
    board_array << board_to_array(@board)
    board_array.map { |row| row.join('  ') }.join("\n")
  end
end