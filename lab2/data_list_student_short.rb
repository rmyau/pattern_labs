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

  #получение таблицы
  def get_data
    id=0
    dt = obj_list.inject([]) do |res, object|
      fields = [id, object.short_name, object.git, object.find_contact]
      row = fields.inject([]) do |row, field|
        row<<field
      end
      id+=1
      res<<row
    end
    DataTable.new(dt)
  end

end

