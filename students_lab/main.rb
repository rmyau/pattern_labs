require_relative 'student_model/student'
require_relative 'student_model/student_short'
require_relative 'data_list_model/data_table'
require_relative 'data_list_student_short'

# st0=Student.new(**{first_name: "Александр",second_name: "Сергеевич",last_name: 'Кукушкин',id:3, phone:'89231432112'})
# puts st0
# st1 = Student.new(**{first_name: "Иван", second_name: "Иванович",last_name: "Иванов",id:2,  email: "kkk3@mail.ru"})
# puts st1
# st2 = Student.new(**{first_name: "Карина", second_name: "Кареновна",last_name: "Краснова",id:1,  email: "bubu_bla@yandex.ru",
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

def read_from_txt(file_path)
  raise ArgumentError, 'File not found' unless File.exist?(file_path)

  file = File.open(file_path){|file| file.read}
  JSON.parse(file).inject([]) do |list, student|
    list << Student.from_json_str(student.to_json)
  end

end


def write_to_txt(file_path, student_list)
  res = '['
  student_list.each do |st|

    res += st.to_json_str + ","
  end
  res = res.chop + "]"
  File.write(file_path, res)
end
#
puts '------------test read'
st_list=read_from_txt('C:\Users\katya\Desktop\ruby_lab\lab2\students_info.txt')
st_list.each do |st|
  puts st.get_info
end
# puts '-------- test write'
# write_to_txt('C:\Users\katya\Desktop\ruby_lab\students_lab\students_out.txt',st_list)
# puts read_from_txt('C:\Users\katya\Desktop\ruby_lab\students_lab\students_out.txt')

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

