# input = array siempre ordenado
# input = target el entero que estamos buscando
# output = el índice de la posición del target en el array.

def binary_search(array, target)
  return -1 if array.length == 0
  array_length = array.length # 4
  lo = 0
  hi = array_length - 1 # 3
  iterate = true
  while true
    middle_index = (lo + hi) / 2
    if array[middle_index] == target # 3 == 1? false
      return middle_index
    elsif hi <= lo
      return -1
    elsif target < array[middle_index] # Descartamos el lado derecho || 1 < 3 true
      hi = middle_index - 1 # [1, *]
    elsif target > array[middle_index] # Descartamos el lado izquierdo
      lo = middle_index + 1 # [*, 4]
    end
  end
end

puts binary_search([1, 2, 3, 4], 1) == 0
puts binary_search([1, 2, 3, 4], 2) == 1
puts binary_search([1, 2, 3, 4], 3) == 2
puts binary_search([1, 2, 3, 4], 4) == 3
puts "-------"
puts binary_search([], 4) == -1
puts binary_search([1, 2, 4, 5, 6, 7, 8], 9) == -1

# By KaizenDevs