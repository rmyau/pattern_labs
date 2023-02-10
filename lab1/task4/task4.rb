def count_after_last_max(list)
  return 0 if list.empty?
  index_max = list.rindex(list.max)
  list.size - index_max-1
end

def before_min_to_end(list)
  index_min = list.index(list.min)
  list.rotate(index_min)
end

puts before_min_to_end([1,3,-2,4])