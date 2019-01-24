# require 'pry'

class Sudoku
  attr_accessor :board, :solution
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
    @solution = ''
    @possibles = '312456789'
    solve(board_string)
  end

  def solved?(str)
    return false if str.include?('-')
    return false if str.split('').reduce(:+) != 405
    if str.split('').reduce(:+) == 405
      true
    end
  end

  def board_to_array(board_string)
    board_string.chars.each_slice(9).to_a
  end

  def get_cols(idx, matrix)
    col_num = idx % 9
    matrix.transpose[col_num].join
  end

  def get_rows(idx, matrix)
    row_num = idx / 9
    matrix[row_num].join
  end


  def find_super_box_index(value_index)
    box_row = value_index / 27
    box_col = value_index / 3 % 3
    STARTING_POINTS[[box_row,box_col]].values.first
  end


  def get_box(box_start, str)
    x = box_start
    super_box = ''
    3.times do
        super_box += str[x..x+2]
        x += 9
    end
    super_box
  end


  def current_possibles(idx, matrix, str)
    box = get_box(find_super_box_index(idx), str)
    row = get_rows(idx, matrix)
    col = get_cols(idx, matrix)
    result = @possibles.split('').reject {|item| (box + row + col).split('').include?(item)}.join('')
    result
  end

  def single_solution?(possible_nums)
    possible_nums.length == 1
  end

  def more_than_one_solution(possible_nums)
    possible_nums.length > 1
  end

  def guess_number(idx, possible_nums)
    @board[idx] = possible_nums.split("").sample.to_s
  end

  def try_number(idx, possible_nums, num)
    @board[idx] = possible_nums.split("")[num].to_s
  end

  def update_board(idx, possible_nums)
      @board[idx] = possible_nums[0].to_s
  end


  def pretty_board
    board_array = board_to_array(@solution)
    puts board_array.map { |row| row.join('  ') }.join("\n")
  end

  private
    def solve(str)
      result = str
      board_matrix = board_to_array(str)
      str.split('').each_with_index do |element, idx|
        if element == '-'
          c_possibles = current_possibles(idx, board_matrix, result)
          num = 0
          return false if c_possibles.length == 0
          while num < c_possibles.length
            result_a = result.split('')
            result_a[idx] = c_possibles[num].to_s
            result = result_a.join
            puts result
            if solved?(result)
              return result
            end
            try = solve(result)
            if !try
              num += 1
            else
              @solution = try.join
              return try
            end
          end
        end
      end
    end

end


# this = Sudoku.new("1-5  8-2  ---
#                    -9-  -76 4-5
#                    2--  4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--")

# nan = this.find_super_box_index(2)


# p this.get_box(nan)
