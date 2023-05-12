# frozen_string_literal: true
require_relative 'change_student_controller'
class ChangeStudentGitController<ChangeStudentController
  public_class_method :new
  def get_editable_fields
    [:git]
  end

end
