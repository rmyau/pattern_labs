require_relative 'student_source_models/files_model/student_list_json'
require_relative 'student_source_models/files_model/student_list_txt'
require_relative 'student_source_models/files_model/student_list_yaml'
require_relative 'student_source_models/files_model/base_student_list'
require_relative 'student_source_models/student_list'
require_relative 'student_source_models/files_model/student_list_strategy'
require_relative 'student_source_models/files_model/file_list_adapter'

# a = StudentListTxt.new()
# a.read_file("C:/Users/katya/Desktop/ruby_lab/students_lab/student_list.txt")
# puts a.students

# puts a.get_k_n_student_short_list(1,2)
# a.write_to_file("C:/Users/katya/Desktop/ruby_lab/students_lab/student_list_out.txt")
# a.sorted

list=[1,2,3]
#
# a = StudentListJson.new()
# a.read_file("C:/Users/katya/Desktop/ruby_lab/students_lab/student_list.json")
# # puts a.students
# a.sorted_by_name
# a.write_to_file("C:/Users/katya/Desktop/ruby_lab/students_lab/student_list_out.json")
#

# a_js = BaseStudentList.new(StudentListJson.new)
#
# a_js.read_file("./students_lab/test_data/student_list.json")
# a_js.type_class=StudentListYaml.new
# a_js.write_to_file("./students_lab/test_data/student_list_out.yaml")
test = StudentList.new(StudentListFileAdapter.new(StudentListTxt.new, 'C:\Users\katya\Desktop\ruby_lab\students_lab\test_data\student_list.txt'))