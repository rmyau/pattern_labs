require_relative 'base_student_list'
class StudentListFileAdapter

  def initialize(type_class, file_path)
    @file = BaseStudentList.new(type_class)
    @file.read_file(file_path)
    @file_path = file_path
  end
  # получить студента по id
  def get_student_by_id(student_id)
    @file.get_student_by_id(student_id)
  end

  #добавление студента
  def add_student(student)
    @file.add_student(student)
    @file.write_to_file(@file_path)
  end

  #удаление студента по id
  def remove_student(student_id)
    @file.delete_student_by_id(student_id)
    @file.write_to_file(@file_path)
  end

  #замена студента по id
  def replace_student(student_id, student)
    @file.replace_student_by_id(student,student_id)
    @file.write_to_file(@file_path)
  end

  #подсчет количества студентов
  def student_count
    @file.get_student_count
  end

  #полуение n элементов page страницы
  def get_k_n_student_short_list(page,n, data_list)
    @file.get_k_n_student_short_list(page, n, data_list)
  end
end

