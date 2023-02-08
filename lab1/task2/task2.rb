def prime(num)
  return true if num==2
  return false if num<=1

  Math.sqrt(num).to_int.downto(2).each do |x|
    return false if (num%x)==0
  end
  true
end

def sum_prime_divide(num)
  s=0
  0.upto(num) do |i|
    if prime(i) && num%i==0
      s+=i
    end
  end

  return s
end

def count_cifr(num)
  s=0
  while num>0
    if num%10>3 && num%10%2==1
      s+=1
    end
    num/=10
  end
  return s
end
#сумма простых делителей числа
# puts sum_prime_divide(10)
# количество нечетных цифр цисла, больших 3
puts count_cifr(5639)
