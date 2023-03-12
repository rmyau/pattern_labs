require_relative 'student'


st0=Student.new(**{first_name: "Александр",second_name: "Сергеевич",last_name: 'Кукушкин',id:3, phone:'89231432112'})
puts st0
st1 = Student.new(**{first_name: "Иван", second_name: "Иванович",last_name: "Иванов",id:2,  email: "kkk3@mail.ru"})
puts st1
st2 = Student.new(**{first_name: "Карина", second_name: "Кареновна",last_name: "Краснова",id:1,  email: "bubu_bla@yandex.ru",
                     telegram: '@karina_super01', git: '@krasnova_kr'})
puts st2

puts st2.validate?


st3=Student.from_json_str('{"first_name":"Максим", "second_name": "Олегович", "last_name": "Арабов"}')
puts st3


