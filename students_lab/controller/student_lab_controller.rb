# frozen_string_literal: true
require_relative '../student_source_models/student_lab'
require_relative '../student_source_models/data_list_model/data_list_student_lab'
class StudentLabController
  def initialize(view)
    @view = view
    @data_list  = DataListStudentLab.new([])
    @data_list.add_observer(@view)
    @student_lab = StudentLab.new
  end

  def refresh_data
    begin
      @data_list = @student_lab.get_lab_list(@data_list)
    rescue SQLite3::SQLException
      api = Win32API.new('user32', 'MessageBox', ['L', 'P', 'P', 'L'], 'I')
      api.call(0, "No connection to DB", "Error", 0)
      exit(false)
    end
  end
end
