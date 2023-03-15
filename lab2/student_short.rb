
class StudentShort
  attr_reader :id, :git, :contact, :short_name

  #стандартный конструктор из строки
  def initialize(id, str)
    data = JSON.parse(str).transform_keys(&:to_sym)
    raise ArgumentError, 'Fields required: short_name' if !data.key?(:short_name) || data[:short_name].nil?
    @id = id
    @short_name = data[:short_name]
    @contact = data[:contact]
    @git = data[:git]
  end


  def self.init_from_student(student)
    StudentShort.new(student.id, JSON.generate({"git":student.git, "short_name": student.short_name, "contact": student.find_contact}))
  end

  def to_s
    result = short_name
    result += " id=#{id} " unless id.nil?
    result += " contact: #{contact}" unless contact.nil?
    result+= " git: #{git}" unless git.nil?
    result
  end
end