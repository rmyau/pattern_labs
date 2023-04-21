# frozen_string_literal: true
require_relative '../views/window'
require_relative '../student_list_models/student_list'
require_relative '../student_list_models/db_model/db_list_adapter'
require_relative '../student_list_models/data_list_model/data_list_student_short'
class StudentListController
  def initialize(view)
    @view = view
    @data_list = DataListStudentShort.new([])
    @data_list.add_observer(@view)
    @student_list = StudentList.new(StudentListDbAdapter.new)
  end

  def on_view_create

  end

  def show_view
    @view.show
  end

  def refresh_data(k_page, number_students)
    @data_list = @student_list.get_k_n_student_short_list(k_page, number_students, @data_list)
    @view.update_count_students(@student_list.student_count)
  end
end
