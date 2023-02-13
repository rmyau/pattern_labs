
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
  list.filter{|x| x>a&&x<b}.max
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

def prime?(num)
  return true if num==2
  return false if num<=1

  Math.sqrt(num).to_int.downto(2).each do |x|
    return false if (num%x)==0
  end
  true
end

def divide_list(list)
  list.inject([]) do |res_divide, el|
    divide = (2..el).inject([]) do |res,i|
      res << i if prime(i)&& el%i==0
      res
    end
    res_divide.concat(divide).uniq
  end
end

file_name = ARGV[0]
array = File.open(file_name) {|file| file.readlines.map(&:to_i)}
methods = [:count_after_last_max, :before_min_to_end, :max_in_interval,:index_less_than_left_repeat, :divide_list]
puts 'Выберите:'
puts '1. Количество элементов после максимального
2. Элементы до минимального в конец массива
3. Максимальный их элементов в заданном интервале
4. Вывести индексы элементов, которые меньше своего левого соседа, и количество таких чисел
5. Построить список всех положительных простых делителей элементов списка без повторений'

method_num = STDIN.gets.chomp.to_i
unless method_num.between?(1, methods.length)
  puts 'Неизвестный метод'
  return
end


if method_num==3
  puts 'Введите границы интервала:'
  print"a="
  a=STDIN.gets.chomp.to_i
  print"b="
  b=STDIN.gets.chomp.to_i
  res = method(methods[method_num-1]).call(array,a,b)
else
  res = method(methods[method_num-1]).call(array)
end
puts res.inspect
if method_num==4
  puts "Количество таких чисел: #{res.size}"
end




