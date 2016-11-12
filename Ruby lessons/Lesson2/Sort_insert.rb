#сортировка вставками из массива


def insert(array, i)
  if i > 0 && array[i] < array[i-1]
    temp = array[i-1]
    array[i-1] = array[i]
    array[i] = temp
    insert(array, i-1)
  end
end
def insert_array(array)
  for i in (1...array.length)
    insert(array,i)
  end
end



$array = [5,8,30,15,20, 10000000000000, 0, 1]
def main
  insert_array($array)
  puts $array.to_s
end

main
