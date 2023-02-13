def prime?(num)
  return true if num==2
  return false if num<=1

  Math.sqrt(num).to_int.downto(2).each do |x|
    return false if (num%x)==0
  end
  true
end

def sum_prime_divide(num)
  s=0
  2.upto(num) do |i|
    if prime(i) && num%i==0
      s+=i
    end
  end

  s
end

def count_cifr(num)
  s=0
  while num>0
    if num%10>3 && num%10%2==1
      s+=1
    end
    num/=10
  end
  s
end

def sum_cifr(num)
  s=0
  while num>0
    s+=num%10
    num/=10
  end
  s
end

def mult_divides(num)
  p=1
  1.upto(num) do |i|
    if  num%i==0 && sum_cifr(i)<sum_cifr(num)
      p*=i
    end
  end
  p
end

# сумма простых делителей числа
puts sum_prime_divide(10)
# количество нечетных цифр цисла, больших 3
puts count_cifr(5639)
# произведение делителей с суммой цифр меньше, чем у исходного
puts mult_divides(72)