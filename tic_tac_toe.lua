turns = 0
grid = {}
for y = 1, 3 do
  grid[y] = {" ", " ", " "}
end

function check_win()
  local turn = get_turn()

  -- Rows
  for y = 1, 3 do
    if turn == grid[y][1] and grid[y][1] == grid[y][2] and grid[y][2] == grid[y][3] then
      return true
    end
  end

  -- Columns
  for x = 1, 3 do
    if turn == grid[1][x] and grid[1][x] == grid[2][x] and grid[2][x] == grid[3][x] then
      return true
    end
  end

  -- Diagonals
  if turn == grid[1][1] and grid[1][1] == grid[2][2] and grid[2][2] == grid[3][3] then
    return grid[1][1]
  elseif turn == grid[1][3] and grid[1][3] == grid[2][2] and grid[2][2] == grid[3][1] then
    return true
  end
end

function draw_board()
  print("\n\t    1   2   3\n")
  for i = 1, 3 do
    print("\t" .. i .. "   " .. grid[i][1] .. " | " .. grid[i][2] .. " | " .. grid[i][3])
    if i < 3 then
      print("\t   ---+---+---")
    end
  end
end

function get_turn()
  if turns % 2 == 0 then
    return "O"
  else
    return "X"
  end
end

while true do
  draw_board()

  print("\nIt's " .. get_turn() .. " turn! Type a coordinate! Ex: \"2 3\":")
  local x, y = io.read("*n", "*n")
  
  if x and y and x > 0 and y > 0 and x < 4 and y < 4 and grid[y][x] == " " then
    grid[y][x] = get_turn()

    if turns > 3 and check_win() then
      draw_board()
      print(get_turn() .. " won!")
      break
    end
    
    turns = turns + 1
    
    if (turns == 9) then
      draw_board()
      print("Draw!")
      break
    end

  end
end
