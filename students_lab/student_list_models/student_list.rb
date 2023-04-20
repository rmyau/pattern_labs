
class StudentList
  def initialize(data_adapter)
    @data_adapter = data_adapter
  end

  # получить студента по id
  def get_student_by_id(student_id)
    @data_adapter.get_student_by_id(student_id)
  end


  #добавление студента
  def add_student(student)
    @data_adapter.add_student(student)
  end

  #удаление студента по id
  def remove_student(student_id)
    @data_adapter.remove_student(student_id)
  end

  #замена студента по id
  def replace_student(student_id, student)
    @data_adapter.replace_student(student_id, student)
  end

  #подсчет количества студентов
  def student_count
    @data_adapter.student_count
  end

  #полуение n элементов page страницы
  def get_k_n_student_short_list(page,n, data_list)
    @data_adapter.get_k_n_student_short_list(page,n, data_list)
  end
end
