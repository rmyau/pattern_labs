# frozen_string_literal: true
require_relative 'change_student_controller'
class ChangeStudentNameController<ChangeStudentController
  public_class_method :new
  def get_editable_fields
    [:first_name, :second_name, :last_name]
  end

end
