# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], # middle row
  [6,7,8], #bttom row
  [0,3,6], #1col
  [1,4,7], #2 col
  [2,5,8], #3 col
  [0,4,8],
  [2,4,6]
]

def won?(board)
# if board.count(" ") == 9  #|| (board.count("X") + board.count("O") == 9)
#   false
# else

 WIN_COMBINATIONS.each do |win_combination|
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = board[win_index_1] # load the value of the board at win_index_1
  position_2 = board[win_index_2] # load the value of the board at win_index_2
  position_3 = board[win_index_3] # load the value of the board at win_index_3

  if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
    (position_1 == "O" && position_2 == "O" && position_3 == "O")
    return  win_combination # return the win_combination indexes that won.
  end
end
  return false
end

def full?(board)
  (board.count("X") + board.count("O") == 9) ? true : false
end

def draw?(board)
  if !won?(board)  && full?(board)
    true
  # elsif ( full?(board) == false)
  #    false
else
  false
   end
end

def over?(board)
if won?(board) || draw?(board) || full?(board)
  true
else
  false
end
end

def winner(board)
  index = []
  index = won?(board)
  if index == false
    return nil
  else
  if board[index[1]] == "X"
    return "X"
  else
    return "O"
  end
end
end
