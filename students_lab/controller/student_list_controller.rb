# frozen_string_literal: true
require_relative '../views/window'
require_relative '../student_list_models/student_list'
require_relative '../student_list_models/db_model/db_list_adapter'
require_relative '../student_list_models/data_list_model/data_list_student_short'
require 'win32api'
class StudentListController
  def initialize(view)
    @view = view
    @data_list = DataListStudentShort.new([])
    @data_list.add_observer(@view)
    @student_list = StudentList.new(StudentListDbAdapter.new)
  end


  def refresh_data(k_page, number_students)
    begin
    @data_list = @student_list.get_k_n_student_short_list(k_page, number_students, @data_list)
    rescue SQLite3::SQLException
      api = Win32API.new('user32', 'MessageBox', ['L', 'P', 'P', 'L'], 'I')
      api.call(0, "No connection to DB", "Error", 0)
      exit(false)
    end
    @view.update_count_students(@student_list.student_count)
  end


end
