# frozen_string_literal: true
require_relative '../views/window'
require '../student_list_models/student_list'
require '../student_list_models/db_model/db_list_adapter'
class StudentListController
  def initialize(view)
    @view = view
  end

  def view_create
    @student_list = StudentList.new(StudentListDbAdapter.new)
  end

  def show_view
    @view.create.run
  end
end
