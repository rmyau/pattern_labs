require_relative 'base_student'
class StudentShort<BaseStudent
  public_class_method :new
  attr_reader :short_name
  private
  attr_writer :short_name

  public
  #стандартный конструктор из строки
  def initialize(id, str)
    data = JSON.parse(str).transform_keys(&:to_sym)
    raise ArgumentError, 'Fields required: short_name' if !data.key?(:short_name) || data[:short_name].nil?
    self.short_name = data[:short_name]
    super(id:id, git:data[:git], phone: data[:phone], email:data[:email], telegram:data[telegram])
  end

  def self.init_from_student(student)
    StudentShort.new(student.id, JSON.generate({"short_name": student.short_name, "phone": student.phone, "telegram": student.telegram, "email": student.email, "git": student.git}))
  end

  def to_s
    result = short_name
    result += " id=#{id} " unless id.nil?
    result += " #{find_contact}"
    result+= "  git=#{git}" unless git.nil?
    result
  end
end