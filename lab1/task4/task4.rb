def count_after_last_max(list)
  return 0 if list.empty?
  index_max = list.rindex(list.max)
  list.size - index_max-1
end

