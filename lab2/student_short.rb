require_relative 'base_student'
class StudentShort<BaseStudent
  attr_reader :contact, :short_name
  #стандартный конструктор из строки
  def initialize(id, str)
    data = JSON.parse(str).transform_keys(&:to_sym)
    raise ArgumentError, 'Fields required: short_name' if !data.key?(:short_name) || data[:short_name].nil?
    @short_name = data[:short_name]
    @contact = data[:contact]
    super(id:id, git:data[:git])
  end

  def self.init_from_student(student)
    StudentShort.new(student.id, JSON.generate({"short_name": student.short_name, "contact": student.find_contact}))
  end

  def to_s
    result = short_name
    result += " id=#{id} " unless id.nil?
    result += " contact: #{contact}" unless contact.nil?
    result+= "  #{find_git}"
    result
  end
end