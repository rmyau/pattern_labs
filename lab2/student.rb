
class Student
  attr_accessor :id, :first_name, :second_name, :last_name, :telegram, :git, :email
  attr_reader :phone
  def initialize(last_name, first_name, second_name, id:nil, phone:nil, telegram: nil, git:nil, email: nil )
    self.last_name=last_name
    self.first_name=first_name
    self.second_name=second_name
    self.id=id
    self.phone=phone
    self.telegram=telegram
    self.git=git
    self.email=email
  end

  #set phone
  def phone=(phone)
    raise ArgumentError, 'Invalid phone number!' unless Student.validate_phone?(phone)
    @phone = phone
  end

  #проверка на номер
  def self.validate_phone?(phone)
    # phone.match(/^(8|\+7)[\- ]?\(?\d{3}\)?[\-_]?\d{3}([\-_]?\d{2}){2}$/)
    phone.match(/^(8|\+7)[\- ]?\(?\d{3}\)?[\- ]?\d{3}([\- ]?\d{2}){2}$/)
  end

  def to_s
    res = "#{last_name} #{first_name} #{second_name}"
    res += " id=#{id}" unless id.nil?
    res += " phone=#{phone}" unless phone.nil?
    res += " git=#{git}" unless git.nil?
    res += " telegram=#{telegram}" unless telegram.nil?
    res += " email=#{email}" unless email.nil?
    res
  end

end