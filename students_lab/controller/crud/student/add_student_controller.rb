# frozen_string_literal: true
require 'logger'
class AddStudentController

  def initialize(student_list)
    @student_list = student_list
    @logger = Logger.new('students_lab/controller_add.log')
  end

  #привязка view
  def add_view(view)
    @view = view
  end

  def execute
    @view.execute
    @logger.info('Executing add student operation')

  end

  def save_student(student)
    @logger.info('Saving student')
    @student_list.add_student(student)
  end


  def validate_fields(fields)
    @logger.info('Validating fields')
    begin
      student = Student.new(**fields)
      return student

    rescue ArgumentError => e
      @logger.error("Error occurred while validating fields: #{e.message}")
      return nil
    end
  end


end
