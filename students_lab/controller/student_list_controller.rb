# frozen_string_literal: true
require_relative '../views/window'
require_relative '../student_source_models/student_list'
require_relative '../student_source_models/db_model/db_list_adapter'
require_relative '../student_source_models/data_list_model/data_list_student_short'
require_relative '../student_source_models/files_model/file_list_adapter'
require_relative '../student_source_models/files_model/student_list_json'
require_relative '../student_source_models/files_model/student_list_yaml'
require_relative '../student_source_models/files_model/student_list_txt'
require_relative 'crud/student/add_student_controller'
require_relative '../views/create_student_dialog'
require_relative '../student_model/student'
require_relative 'crud/student/change_student_name_controller'
require_relative 'crud/student/change_student_git_controller'
require_relative 'crud/student/change_student_contact_controller'

require 'fox16'
require 'win32api'
include Fox
class StudentListController
  def initialize(view)
    @view = view
    @data_list = DataListStudentShort.new([])
    @data_list.add_observer(@view)
    @student_list = StudentList.new(StudentListDbAdapter.new)
    adapter_path = 'C:\Users\katya\Desktop\ruby_lab\students_lab\test_data\student_list.yaml'
    # @student_list = StudentList.new(StudentListFileAdapter.new(StudentListYaml.new, adapter_path))
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

  #добавление студента
  def student_add
    controller = AddStudentController.new(@student_list)
    show_dialog(controller)
  end

  #изменение студента
  public
  def student_change(index, controller_type)
    @data_list.select(index)
    id = @data_list.get_select
    @data_list.clear_selected

    controller = controller_type.new(@student_list, id)
    show_dialog(controller)
  end

  def student_change_name(index)
    student_change(index, ChangeStudentNameController)
  end

  def student_change_git(index)
    student_change(index, ChangeStudentGitController)
  end

  def student_change_contact(index)
    student_change(index, ChangeStudentContactController)
  end


  #удаление студента
  def student_delete(indexes)
    @data_list.select(*indexes)
    id_list = @data_list.get_select
    @data_list.clear_selected

    id_list.each{|student_id| @student_list.remove_student(student_id)}
    @view.refresh
  end

  private
  #привязка модального окна
  def show_dialog(controller)
    view = CreateStudentDialog.new(@view, controller)
    controller.add_view(view)
    controller.execute

    @view.refresh
  end

end
