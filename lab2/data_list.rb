
class DataList
  private
  attr_writer :obj_list

  public
  def initialize(*obj_list)
    self.obj_list = *obj_list
  end
end

