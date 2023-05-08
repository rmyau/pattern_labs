# frozen_string_literal: true
require_relative '../student_model/student'
class AddStudentController

  #привязка view
  def add_view(view)
    @view = view
  end

  def validate_fields(fields)
    begin
      student = Student.new(**fields)
      return student

    rescue ArgumentError => e
      return nil
    end
  end

  def execute
    @view.execute
  end

end
