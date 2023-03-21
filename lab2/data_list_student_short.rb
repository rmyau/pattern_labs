require_relative 'data_list'
require_relative 'data_table'

class DataListStudentShort<DataList

  public_class_method :new

  def initialize(obj_list)
    super
  end

  #получение массива наименования аттрибутов
  def get_names
    %w[short_name git find_contact]
  end

  protected
  def get_fields(object)
    [object.short_name, object.git, object.find_contact]
  end
end

