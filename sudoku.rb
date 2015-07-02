=begin
---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---

- - - 2 6 - 7 - 1
6 8 - - 7 - - 9 -
1 9 - - - 4 5 - -
8 2 - 1 - - - 4 -
- - 4 6 - 2 9 - -
- 5 - - - 3 - 2 8
- - 9 3 - - - 7 4
- 4 - - 5 - - 3 6
7 - 3 - 1 8 - - -

=end

def parse_sudoku_str(str)
  str.split("").map(&:to_i).each_slice(9).to_a
end

def verify_row(posible_numbers,mat,x,y)
  (0...9).each do |i|
    if mat[x][i] != 0
      posible_numbers[ mat[x][i] ] = false
    end
  end
  posible_numbers
end

def verify_column(posible_numbers,mat,x,y)
  (0...9).each do |i|
    if mat[i][y] != 0
      posible_numbers[ mat[i][y] ] = false
    end
  end
  posible_numbers
end

def verify_sub_matrix(posible_numbers,mat,x,y)
  x_offset = (x/3).floor*3
  y_offset = (y/3).floor*3

  (0...3).each do |i|
    (0...3).each do |j|
      posible_numbers[ mat[i + x_offset][j + y_offset] ] = false
    end
  end
  posible_numbers
end

def solve(mat,blank_spaces,curr_blank)
  if curr_blank == blank_spaces.length
    return true
  end
  i = blank_spaces[curr_blank][0]
  j = blank_spaces[curr_blank][1]
  # verificar los numeros posibles para la casilla (i,j)
  #  1 2 3 4 5 6 7
  # [t,t,t,t,t,t,t,t]
  posible_numbers = Array.new(10,true)
  posible_numbers = verify_row(posible_numbers,mat,i,j)
  posible_numbers = verify_column(posible_numbers,mat,i,j)
  posible_numbers = verify_sub_matrix(posible_numbers,mat,i,j)
  # probar uno por uno
  (1..9).each do |n|
    if posible_numbers[n]
      mat[i][j] = n
      if solve(mat,blank_spaces,curr_blank+1)
        return true
      end
      mat[i][j] = 0
    end
  end
  return false
end

def calc_blank_spaces(mat)
  #[[1,2],[4,5],[8,10]]
  blank_spaces = []
  (0...9).each do |i|
    (0...9).each do |j|
      if mat[i][j] == 0
        blank_spaces << [ i,j ]
      end
    end
  end
  blank_spaces
end

def solve_sudoku(str)
  mat = parse_sudoku_str(str)
  blank_spaces = calc_blank_spaces(mat)
  solve(mat,blank_spaces,0)
  mat
end

mat = solve_sudoku("---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---")

puts mat.join == "435269781682571493197834562826195347374682915951743628519326874248957136763418259"
