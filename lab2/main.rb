require_relative 'student'
require_relative 'student_short'

st0=Student.new(**{first_name: "Александр",second_name: "Сергеевич",last_name: 'Кукушкин',id:3, phone:'89231432112'})
puts st0
st1 = Student.new(**{first_name: "Иван", second_name: "Иванович",last_name: "Иванов",id:2,  email: "kkk3@mail.ru"})
puts st1
st2 = Student.new(**{first_name: "Карина", second_name: "Кареновна",last_name: "Краснова",id:1,  email: "bubu_bla@yandex.ru",
                     telegram: '@karina_super01', git: '@krasnova_kr'})
puts st2

puts st2.validate?
puts st2.short_name
puts st1.getInfo

st3=Student.from_json_str('{"first_name":"Максим", "second_name": "Олегович", "last_name": "Арабов"}')
puts st3

st_sh1=StudentShort.new(5,'{"short_name": "Разумов Г.В.", "git": "@rasdva"}')
puts st_sh1

st_sh2=StudentShort.init_from_student(st3)
puts st_sh2


