
class DataList
  attr_reader :obj_list
  def initialize(obj_list)
    self.obj_list=obj_list
    self.selected_items=[]
  end

  #выделение элементов по номеру
  def select(*numbers)
    selected_items.append(*numbers)
  end
  #массив id выделенных элементов
  def get_select
    obj_list[selected_items].id
  end

  def get_names; end

  def get_data; end
  protected
  attr_writer :obj_list
  attr_accessor :selected_items
end