puts "Введите команду для ОС"
cmd_os = `#{STDIN.gets.chomp}`
puts cmd_os
# system cmd_os

puts "Введите команду языка ruby"
cmd_ruby= `ruby -e "#{STDIN.gets.chomp}"`
# system "ruby -e \"#{cmd_ruby}\""
puts cmd_ruby
