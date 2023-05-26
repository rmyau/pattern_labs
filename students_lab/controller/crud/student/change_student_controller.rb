# frozen_string_literal: true
require_relative 'add_student_controller'
require 'logger'
class ChangeStudentController<AddStudentController
  private_class_method :new
  def initialize(student_list, student_id)
    super(student_list)
    @student_id = student_id
    @logger = Logger.new('students_lab/controller_update.log') #
  end

  def add_view(view)
    super(view)
    student = @student_list.get_student_by_id(@student_id)
    @view.set_student(student, get_editable_fields)
  end

  def save_student(student)
    @student_list.replace_student(@student_id, student)
  end

  private
  def get_editable_fields; end
end
