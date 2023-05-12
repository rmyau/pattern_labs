# frozen_string_literal: true
require_relative 'change_student_controller'
class ChangeStudentContactController<ChangeStudentController
  public_class_method :new

  private
  def get_editable_fields
    [:phone, :email, :telegram]
  end

end
