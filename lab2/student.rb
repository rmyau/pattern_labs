require 'json'
require_relative 'base_student'
class Student<BaseStudent
  public_class_method :new
  attr_reader :first_name, :second_name, :last_name
  #открываем сеттеры и геттеры из базового класса
  public :phone, :telegram, :email, 'id=', 'phone=', 'telegram=', 'email=', 'git='
  def initialize(last_name: nil, first_name: nil, second_name: nil, id: nil, phone:nil, telegram: nil, email: nil, git:nil)
    raise ArgumentError, "Required fields: first_name, second_name and last_name!" if first_name.nil? || second_name.nil?|| last_name.nil?
    self.last_name=last_name
    self.first_name=first_name
    self.second_name=second_name
    super(id:id, phone:phone, telegram:telegram, email:email, git:git)
  end

  #конструктор для аргументов в строке
  def self.from_json_str(str)
    data=JSON.parse(str).transform_keys(&:to_sym)
    Student.new(**data)
  end

  def first_name=(first_name)
    raise ArgumentError, 'Invalid first_name!' unless first_name.nil? || Student.validate_name?(first_name)
    @first_name=first_name
  end

  def second_name=(second_name)
    raise ArgumentError, 'Invalid second_name!' unless second_name.nil? || Student.validate_name?(second_name)
    @second_name=second_name
  end

  def last_name=(last_name)
    raise ArgumentError, 'Invalid last_name!' unless last_name.nil? || Student.validate_name?(last_name)
    @last_name=last_name
  end

  #корректность имени(учтены двойные имена)
  def self.validate_name?(name)
    name.match(/^[А-Я][а-я]+(-[А-Я][а-я]+)*$/)
  end

  #имя с инициалами
  def short_name
    "#{last_name} #{first_name[0]}. #{second_name[0]}."
  end
  def get_info
    "#{short_name}, #{find_git}, #{find_contact}"
  end
  def to_s
    res = "#{last_name} #{first_name} #{second_name}"
    res += " id=#{id}" unless id.nil?
    res += " phone=#{phone}" unless phone.nil?
    res += " #{find_git}"
    res += " telegram=#{telegram}" unless telegram.nil?
    res += " email=#{email}" unless email.nil?
    res
  end

end



