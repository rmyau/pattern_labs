
class DataTable
  def initialize(table)
    self.table = table
    self.row_number = table.size
    self.column_number = max_size_column
  end
  attr_reader :row_number, :column_number

  #получить элемент по номеру столбца и строки
  def get_item(row, col)
    return nil if row>=row_number||col>=column_number
    table[row][col].dup
  end

  def each(&block)
    table.each do |row|
      block.call(row)
    end
  end

  private
  attr_accessor :table
  attr_writer :row_number, :column_number

  #максимальный размер столбца
  def max_size_column
    max_size=0
    table.each{|el| max_size=el.size if el.size>max_size }
    max_size
  end
end

