# frozen_string_literal: true
require_relative '../student_source_models/student_lab'
require_relative '../student_source_models/data_list_model/data_list_student_lab'
require_relative '../controller/crud/labs/add_lab_controller'
require_relative '../views/create_lab_dialog'
require_relative 'crud/labs/change_lab_controller'
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

  def add_lab
    controller = AddLabController.new(@student_lab)
    show_dialog(controller)
  end

  def show_dialog(controller)
    view = CreateLabDialog.new(@view, controller)
    controller.add_view(view)
    controller.execute

    @view.refresh
  end

  def get_count_lab
    @student_lab.lab_count
  end
  def delete_lab
    @student_lab.remove_lab(get_count_lab)
    @view.refresh
  end

  def update_lab(index)
    @data_list.select(index)
    id = @data_list.get_select
    @data_list.clear_selected

    controller = ChangeLabController.new(@student_lab, id)
    show_dialog(controller)
  end
end
