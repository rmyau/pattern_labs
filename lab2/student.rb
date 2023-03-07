
class Student
  attr_accessor :id, :first_name, :second_name, :last_name, :phone, :telegram, :git, :email

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