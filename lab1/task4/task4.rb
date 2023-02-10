def count_after_last_max(list)
  return 0 if list.empty?
  index_max = list.rindex(list.max)
  list.size - index_max-1
end

def before_min_to_end(list)
  index_min = list.index(list.min)
  list.rotate(index_min)
end

def max_in_interval(list, a,b)
  list[a..b].max
end
puts max_in_interval([1,2,-2,4],0,0)