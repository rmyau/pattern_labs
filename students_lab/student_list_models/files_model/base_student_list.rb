require_relative '../../student_model/student'
require_relative '../../student_model/student_short'
require_relative '../data_list_model/data_list_student_short'
class BaseStudentList
  attr_writer :type_class
  def initialize(type_class)
    self.students = []
    self.type_class = type_class
  end

  #чтение из файла
  def read_file(file_path)
    raise ArgumentError, 'File not found' unless File.exist?(file_path)
    list_hash = type_class.list_hash_from_str(File.read(file_path))
    self.students = list_hash.map {|st| Student.new(**st)}
    # get_new_student_id
  end

  #запись в файл
  def write_to_file(file_path)
    list_hash = students.map(&:to_hash)
    File.write(file_path, type_class.list_hash_to_str(list_hash))
  end

  #получить объект Student по id
  def get_student_by_id(id)
    students.find {|st| st.id==id}
  end

  #полуение n элементов page страницы
  def get_k_n_student_short_list(page, n, data_list)
    page_list = students[(page-1)*n, n].map{|st| StudentShort.init_from_student(st)}
    return DataListStudentShort.new(page_list) if data_list.nil?

    data_list.replace_objects(page)
    data_list
  end

  #сортировка по фамилии и инициалам
  def sorted_by_name
    students.sort_by(&:short_name)
  end

  #добавление Student в список
  def add_student(student)
    student.id = get_new_student_id
    students << student
  end

  #заменить элемент students по id
  def replace_student_by_id(student, st_id)
    id_student = students.find_index{|st| st.id==st_id}
    students[id_student] = student
  end

  #удаление студента
  def delete_student_by_id(st_id)
    students.delete_if {|st| st.id==st_id}
  end

  #получение количества студентов
  def get_student_count
    students.size
  end


  private
  attr_accessor :students
  attr_reader :type_class

  #получение нового id для студента
  def get_new_student_id
    students.max_by(&:id).id +1
  end
end
