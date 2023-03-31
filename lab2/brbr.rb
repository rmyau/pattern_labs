require_relative 'files_model/student_list_json'
require_relative 'files_model/student_list_txt'
require_relative 'files_model/student_list_yaml'
require_relative 'files_model/base_student_list'

# a = StudentListTxt.new()
# a.read_file("C:/Users/katya/Desktop/ruby_lab/lab2/student_list.txt")
# puts a.students

# puts a.get_k_n_student_short_list(1,2)
# a.write_to_file("C:/Users/katya/Desktop/ruby_lab/lab2/student_list_out.txt")
# a.sorted

list=[1,2,3]
#
# a = StudentListJson.new()
# a.read_file("C:/Users/katya/Desktop/ruby_lab/lab2/student_list.json")
# # puts a.students
# a.sorted_by_name
# a.write_to_file("C:/Users/katya/Desktop/ruby_lab/lab2/student_list_out.json")
#


a = BaseStudentList.new(StudentListYaml.new)
a.read_file("C:/Users/katya/Desktop/ruby_lab/lab2/test_data/student_list.yaml")
# puts a.students
# a.sorted_by_name
a.write_to_file("C:/Users/katya/Desktop/ruby_lab/lab2/test_data/student_list_out.yaml")

