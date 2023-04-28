class BaseStudent
  #сделали класс абстрактным
  private_class_method :new

  protected

  attr_reader :phone, :email, :telegram
  attr_writer :id

  def telegram=(telegram)
    raise ArgumentError, 'Invalid telegram!' unless telegram.nil? || Student.validate_account?(telegram)
    @telegram=telegram
  end

  def git=(git)
    raise ArgumentError, 'Invalid git!' unless git.nil? || Student.validate_account?(git)
    @git=git
  end

  def email=(email)
    raise ArgumentError, 'Invalid email!' unless email.nil? || Student.validate_email?(email)
    @email=email
  end
  def phone=(phone)
    raise ArgumentError, 'Invalid phone number!' unless phone.nil? || Student.validate_phone?(phone)
    @phone = phone
  end

  def set_contacts(email:nil, phone:nil, telegram:nil)
    self.email = email
    self.phone = phone
    self.telegram = telegram
  end

  public

  attr_reader :id, :git
  def initialize(id: nil, phone:nil, telegram: nil, email: nil, git:nil )
    self.id=id
    self.git=git
    set_contacts(**{telegram:telegram, phone: phone, email:email})
  end

  #проверка на номер
  def self.validate_phone?(phone)
    phone.match(/^(8|\+7)[\- ]?\(?\d{3}\)?[\- ]?\d{3}([\- ]?\d{2}){2}$/)
  end

  #валидация для гита и телеграмма
  def self.validate_account?(account)
    account.match(/^@[\w-]+$/)
  end

  #валидация для почты
  def self.validate_email?(email)
    email.match(/^\w+[-\w.]+@([A-Za-z]+\.)+[A-z]{2,4}$/)
  end

  def git?
    !git.nil?
  end

  def exist_contact?
    !(telegram.nil? && email.nil? && phone.nil?)
  end

  def validate?
    git? && exist_contact?
  end


  #строка для вывода любого одного контакта
  def find_contact
    if exist_contact?
      return "phone: #{phone}" unless phone.nil?
      return "telegram: #{telegram}" unless telegram.nil?
      return "email: #{email}" unless email.nil?
    end
    nil
  end




end

