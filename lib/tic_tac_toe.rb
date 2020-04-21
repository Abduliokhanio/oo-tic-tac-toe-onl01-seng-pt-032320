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

  def won?
    epoch = 0

     while epoch < WIN_COMBINATIONS.length
      first_index = WIN_COMBINATIONS[epoch][0]
      sec_index = WIN_COMBINATIONS[epoch][1]
      third_index = WIN_COMBINATIONS[epoch][2]

      first_pos = @board[first_index]
      sec_pos = @board[sec_index]
      third_pos = @board[third_index]

     if first_pos == sec_pos && sec_pos == third_pos && first_pos != " "

        winning_combo = [first_index, sec_index, third_index]

     end

     #binding.pry
    #   if array != WIN_COMBINATIONS[epoch]
    #     false
    #   else
    #     true
    #     break
    #   end
    epoch += 1
    end
    winning_combo
  end

  def full?
    if turn_count == 9
      true
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if winning_combo = won?
      @board[winning_combo.first]
    end
  end

  def play
    while !over?
      turn
    end

    if won?
      if turn_count.odd?
      puts "Congratulations X!"
      else turn_count.even?
      puts  "Congratulations O!"
      end
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
