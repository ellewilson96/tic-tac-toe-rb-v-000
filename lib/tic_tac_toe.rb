def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(move)
   position = move.to_i - 1
   position
end

def move(board, position, token = "X")
  board[position] = token
end

def valid_move?(board,position)
  if position.between?(0,8) && !position_taken?(board,position)
    puts "this is a valid move"
    return true
  else
     return false
  end
end

def position_taken?(board,position)
  if board[position] == " "
    false
    elsif board[position] == ""
    false
    elsif  board[position] == nil
    false
    else   board[position] == "X" || "O"
    true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  position = input_to_index(user_input)
  if valid_move?(board,position)
    puts "valid move"
    move(board, position, token = "X")
    display_board(board)
  else
    puts "try again"
    turn(board)
end
end


WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def won?(board)
WIN_COMBINATIONS.find do |win_combo|
  board[win_combo[0]] == board[win_combo[1]] && board[win_combo[0]] == board[win_combo[2]] && position_taken?(board, win_combo[1])
end
end

def full?(board)
  board.none? do |i|
    i == " " || i.nil?
  end
end

def draw?(board)
  won?(board) == nil && full?(board) == true
end

def over?(board)
  if draw?(board) == true
    true
  elsif won?(board) != nil && full?(board) == true
    true
  elsif won?(board) != nil && full?(board) == false
    true
  else
    false
  end
end

def winner(board)
  if won?(board) != nil
    winner = board[won?(board)[0]]
  end
end
