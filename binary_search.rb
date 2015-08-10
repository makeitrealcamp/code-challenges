# input = array siempre ordenado
# input = target el entero que estamos buscando
# output = el índice de la posición del target en el array.
def binary_search(array, target)
  lo = 0
  hi = array.length - 1 # arreglos en Ruby empiezan con índice 0
  while lo <= hi
    middle_index = lo + ((hi - lo) / 2)
    if array[middle_index] == target
      return middle_index
    end

    if target < array[middle_index] # Descartamos la mitad derecha del arreglo
      hi = middle_index - 1
    else # Descartamos la mitad izquierda del arreglo
      lo = middle_index + 1
    end
  end

  return -1
end

# Tests
require "test/unit/assertions"
include Test::Unit::Assertions

assert binary_search([1, 2, 3, 4], 1) == 0
assert binary_search([1, 2, 3, 4], 2) == 1
assert binary_search([1, 2, 3, 4], 3) == 2
assert binary_search([1, 2, 3, 4], 4) == 3
assert binary_search([], 4) == -1
assert binary_search([1, 2, 4, 5, 6, 7, 8], 9) == -1

# By KaizenDevs
