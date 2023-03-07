require_relative 'student'

st1= Student.new("Иванов", "Иван", "Иванович")
st2= Student.new("Краснова", "Карина", "Кареновна", id:2, email: "kkk3@mail.ru")

puts st1
puts st2
st0=Student.new("Иванов", "Иван", "Иванович",**{id:3, phone:'89231432112'})
puts st0
