require 'pry'
class TicTacToe

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2],
  ]

  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(pos, player)
    @board[pos] = player
  end

  def position_taken?(pos)
    @board[pos] != " "
  end

  def valid_move?(pos)
    !position_taken?(pos) && pos.between?(0,8)
  end

  def turn_count
    turn_count = 0
    @board.each do |sqr|
      if sqr != " "
        turn_count += 1
      end
    end
    turn_count
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    puts "Plz make move?(0-8)"
    move2 = gets.strip
    answer = input_to_index(move2)

    if valid_move?(answer)
      move(answer, current_player)
    else
      turn
    end
    display_board
  end

end
