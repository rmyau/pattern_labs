require_relative 'files_model/student_list_txt'

a = StudentListTxt.new()
a.read_file("C:/Users/katya/Desktop/ruby_lab/lab2/student_list.txt")
# puts a.students

puts a.get_k_n_student_short_list(1,2)
# a.write_to_file("C:/Users/katya/Desktop/ruby_lab/lab2/student_list_out.txt")
# a.sorted

list=[1,2,3]
