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
    @main_controller.validate_fields(fields)
  end

  def execute
    @view.execute
  end

end
