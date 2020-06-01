class TicTacToe
  
  def initialize(board=nil)
    # @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  
  ]
  
  def display_board
  
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "

  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def move(index, char = "X")
    @board[index] = char
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == ""
      false
    elsif @board[index] == nil
      false
    else @board[index] == "X" || @board[index] == "O"
      true
    end
  end

  def valid_move?(index)
    if index.between?(0, 8) && !position_taken?(index)
      true
    else
      false
    end
  end
  
  def turn_count
    counter = 0
    @board.each do |turn|
      if turn == "X" 
        counter += 1
      elsif turn == "O"
        counter += 1
      end
    end
    counter
  end
  
  def current_player
    if turn_count % 2 == 0
      "X"
    else 
      "O"
    end
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
    else
      turn
    end
    display_board
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      @board[win_combination[0]] == @board[win_combination[1]] && 
      @board[win_combination[1]] == @board[win_combination[2]] && 
      position_taken?(win_combination[0])
    end
  end
  
  def full?
    
  #   WIN_COMBINATIONS.each do |win_combination|
  #     if @board[win_combination[0]] == " " || @board[win_combination[1]] == " " || @board[win_combination[2]] == " "
  #         return false
  #     else
  #         return true
  #     end
  #   end
  # end
  
    WIN_COMBINATIONS.none? do |win_combination|
      if @board[win_combination[0]] == " " 
        return false
      elsif @board[win_combination[1]] == " "
        return false
      elsif @board[win_combination[2]] == " "
        return false
      end
    end
  end

end