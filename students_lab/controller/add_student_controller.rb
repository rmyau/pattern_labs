# frozen_string_literal: true
require_relative '../student_model/student'
class AddStudentController
  def initialize(parent)
    @main_controller = parent
  end

  #привязка view
  def add_view(view)
    @view = view
  end

  def validate_fields(fields)
    begin
      student = Student.new(**fields)
      puts "student student"
      return student

    rescue ArgumentError => e
      # puts "no validate"
      return false
    end
  end
  # def validate_fields(field_key, field_data)
  #   case field_key
  #   when :first_name || :second_name || :last_name
  #     return Student.validate_name?(field_data)
  #   when :phone
  #     return Student.validate_phone?(field_data)
  #   when :telegram || :git
  #     return Student.validate_account?(field_data)
  #   when :email
  #     return Student.validate_email?(field_data)
  #   end
  # end
  #
end
