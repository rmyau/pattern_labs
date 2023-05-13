# frozen_string_literal: true
require_relative 'data_list'
require_relative 'data_table'

class DataListStudentLab<DataList
  public_class_method :new

  protected
  def get_fields(object)
    [object.id, object.git, object.find_contact]
  end

end
