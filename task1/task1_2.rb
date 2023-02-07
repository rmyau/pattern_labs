name = ARGV[0]
puts "Привет, #{name}!!!"

puts "Какой Ваш любимый язык программирования?"
langv = STDIN.gets.chomp
case langv
	when "ruby"
		puts "Подлиза!"
	when "C++"
		puts "Жесть умный!!"
	when "Python"
		puts "Вопросов больше нет..."
	else 
		puts "Скоро будет Ruby!"
end