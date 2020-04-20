class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " ", ]
  end
  
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

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(answer)
    @board[answer] != " "
  end
  
  def valid_move?(number_entered)
    if number_entered.between?(0,8) && !(position_taken?(number_entered))
      true
    else
      false
    end
  end
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
  #if turn_count(board) %  == 0
    num = turn_count
    if num % 2 == 0
      return "X"
    else
      return "O"
    #puts "divisible by 2"
    end
  end
  
  def turn
      puts "Please enter 1-9:"
      answer = gets.chomp
      answer = input_to_index(answer)
      if valid_move?(answer)
        move(answer, current_player)
        display_board
        #turn(board)
      else
        puts "That is an invalid entry!"
        turn
      end
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

end
