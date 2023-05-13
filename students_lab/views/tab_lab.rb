# frozen_string_literal: true
require 'fox16'
include Fox
class TabLab<FXVerticalFrame
  def initialize(parent, *args, &blk)
    super
    add_table
  end

  def add_table
    table_frame = FXVerticalFrame.new(self, :padLeft=>20)
    # page_change_buttons(table_frame)
    # Создаем таблицу
    @table = FXTable.new(table_frame, :opts =>  TABLE_READONLY|LAYOUT_FIX_WIDTH|LAYOUT_FIX_HEIGHT|TABLE_COL_SIZABLE|TABLE_ROW_RENUMBER, :width=>580, :height=>320)
    @table.setTableSize(16, 3)

    @table.setColumnText(0, "Номер")
    @table.setColumnText(1, "Наименование")
    @table.setColumnText(2, "Дата выдачи")

    # Масштабируем таблицу
    @table.setRowHeaderWidth(30)
    # @table.setColumnWidth(0, 150)
    # @table.setColumnWidth(1, 150)
    # @table.setColumnWidth(2, 200)

  end

end
