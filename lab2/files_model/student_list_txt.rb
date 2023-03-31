
require_relative 'student_list_strategy'
require 'json'
class StudentListTxt<StudentListStrategy
  public_class_method :new

  #получение массива хэшей из строки
  def list_hash_from_str(str)
    to_hash_list(str.split("\n"))
  end

  #получение строки заданного вида из массива хэшей
  def list_hash_to_str(list_hash)
    list_str = list_hash.map do |hash|
      hash.map { |key, value| "#{key}: #{value}"}.join(",")
    end
    list_str.join("\n")
  end

  private
  #массив хэшей из массива строк
  def to_hash_list(list_str)
    # list_hash={}
    list_str.inject([]) do |list_hash, str |
      students_hash={}
      str.split(',').each do |attr|
        key,value = attr.split(':').map(&:strip)
        students_hash[key]=value
      end
      list_hash<<students_hash.transform_keys(&:to_sym)
    end
  end

end

