# NanCatVicious
Recursive sudoku solution

## How it works

1) The Sudoku puzzle is received in this format `1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--` which is essentially a collapsed version of a partially filled sudoku puzzle. The `-` represent empty spaces.

2) The algorithm iterates through the string beginning at index 0 to find empty spaces. When it finds a `-`, the algorithm filters the possibilities for that individual space (example: `[1, 2, 3, 4, 5, 6, 7, 8, 9]` would be filtered to `[4, 7]` for the empty space at `index 2` in the sudoku string mentioned in step 1)

3) The algorithm plugs in the first possibility and then attempts to continue solving the board. If the next empty space has zero solutions, the algorithm traces back to the previous empty space and attempts the next possibility.

4) The board needs to pass 2 tests for it to be considered complete. The algorithm first checks to see if there are any empty spaces left. Then the algorithm aggregates all the numbers in the board to ensure they add up to 405. 405 is the sum of all solved sudoku board puzzles.


## How to run
1) clone repo `git clone https://github.com/wvicioso/NanCatVicious.git`

2) In the console, run `ruby runner.rb`

## Area for improvements

As of now, the algorithm attempts to solve the board with brute force. Each possibility is attempted in order. Because of this, some puzzles might take more than 5 minutes since the branches created during the recursion can sometimes be very long.
