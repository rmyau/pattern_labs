
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

def index_less_than_left(list)
  list.filter {|x| list.index(x)!=0 && x<list[list.index(x)-1] }.map {|el| list.index(el)}
end

def index_less_than_left_repeat(list)
  (1..list.size-1).inject([]) do |res,i|
    res << i if list[i]<list[i-1]
    res
  end
end

def prime(num)
  return true if num==2
  return false if num<=1

  Math.sqrt(num).to_int.downto(2).each do |x|
    return false if (num%x)==0
  end
  true
end

def divide_list(list)
  res_divide = []
  list.each do |el|
    res = (2..el).inject([]) do |res,i|
      res << i if prime(i)&& el%i==0
      res
    end
    res_divide.concat(res)
  end
  res_divide.uniq
end


puts divide_list([10,6])

# puts max_in_interval([1,2,-2,4],0,0)