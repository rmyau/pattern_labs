require_relative 'student_model/student'
require_relative 'student_model/student_short'
require_relative 'data_list_model/data_table'


# st0=Student.new(**{first_name: "Александр",second_name: "Сергеевич",last_name: 'Кукушкин',id:3, phone:'89231432112'})
# puts st0
# st1 = Student.new(**{first_name: "Иван", second_name: "Иванович",last_name: "Иванов",id:2,  email: "kkk3@mail.ru"})
# puts st1
#                      telegram: '@karina_super01', git: '@krasnova_kr'})
# puts st2
#
# puts st2.validate?
# puts st2.short_name
# puts st1.get_info
# #
# st3=Student.from_json_str('{"first_name":"Максим", "second_name": "Олегович", "last_name": "Арабов"}')
# st3.set_contacts(**{phone: '89621294567'})
# puts st3
# puts st3.get_info
# #
# st_sh1=StudentShort.new(5,'{"short_name": "Разумов Г.В.", "git": "@rasdva"}')
#
# puts st_sh1
#
# st_sh2=StudentShort.init_from_student(st3)
# puts st_sh2

# dt=DataTable.new([[3,4],[1,2,3]])
# puts dt.row_number, dt.column_number
# puts 'yes ' if dt.get_item(0,2).nil?
#
# st3=Student.from_json_str('{"first_name":"Максим", "second_name": "Олегович", "last_name": "Арабов"}')
# st3.set_contacts(**{phone: '89621294567'})
# # puts st3
# #
# st_sh1=StudentShort.new(5,'{"short_name": "Разумов Г.В.", "git": "@rasdva"}')
#
# # puts st_sh1
#
# st_sh2=StudentShort.init_from_student(st3)
# # puts st_sh2
# dlsh= DataListStudentShort.new([st_sh1, st_sh2])
# puts dlsh.get_data
# puts dlsh.get_names

def student_fields(student)
  [student.first_name, student.last_name,  student.second_name, student.phone, student.telegram, student.email, student.git]
end
require 'sqlite3'

require_relative 'db_model/students_list_db'


db=StudentListDB.new('C:\Users\katya\Desktop\ruby_lab\db_student.sql')

st2 = Student.new(**{first_name: "Карина", second_name: "Кареновна",last_name: "Краснова", email: "bubu_bla@yandex.ru"})
# db.add_student(st2)
# db.get_student_by_id(2)
puts db.get_k_n_student_short_list(2,2)


