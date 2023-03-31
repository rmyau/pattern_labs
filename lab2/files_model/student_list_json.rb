require_relative 'base_student_list'
require 'json'
class StudentListJson<BaseStudentList
  public_class_method :new
  private
  #получение массива хэшей из строки
  def list_hash_from_str(str)
    JSON.parse(str,  {symbolize_names: true })
  end

  #получение строки заданного вида из массива хэшей
  def list_hash_to_str(list_hash)
    JSON.generate(list_hash)
  end

end
