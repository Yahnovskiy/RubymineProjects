def quick_sort (array, first, last)
  i = first
  j = last
  middle_index = (first+last)/2
  pivot = array[middle_index]
  #puts "pivot = #{pivot}"
  while (i < j)
    while (array[i] < pivot)
      i+= 1
      #puts "i= #{i}"
    end
    while (array[j] > pivot)
      j -= 1
      #puts "j = #{j}"
    end
    if (i <= j)
      temp = array[i]
      array[i]=array[j]
      array[j]=temp
      i += 1
      j -= 1
     # puts "array after change = #{array.to_s}"
    end
  end

  if (first < j)
    quick_sort(array, first, j)
  if (i < last)
    quick_sort(array, i, last)
end
  end

end

def main
 array = [10, 5, 20, 8, 6, 40, 80]
 quick_sort(array, 0, array.size-1)
 puts array.to_s
end
  main